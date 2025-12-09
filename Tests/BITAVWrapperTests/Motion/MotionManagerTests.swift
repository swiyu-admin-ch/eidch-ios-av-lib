import CoreMotion
import XCTest
@testable import BITAVWrapper

class MotionManagerTests: XCTestCase {

  var sut: MotionManager!
  var mockMotionProvider: MockMotionDataProvider!
  var mockDelegate: MockMotionManagerDelegate!

  override func setUp() {
    super.setUp()
    mockMotionProvider = MockMotionDataProvider()
    mockDelegate = MockMotionManagerDelegate()
    sut = MotionManager(
      motionDataProvider: mockMotionProvider,
      recordsLimit: 5,
      coefficient: 100,
      updateInterval: 0.016)
    sut.delegate = mockDelegate
  }

  override func tearDown() {
    sut = nil
    mockMotionProvider = nil
    mockDelegate = nil
    super.tearDown()
  }

  // MARK: - Initialization Tests

  func testInit_SetsCorrectDefaults() {
    XCTAssertTrue(sut.records.isEmpty)
    XCTAssertFalse(sut.isCollecting)
    XCTAssertEqual(sut.recordsLimit, 5)
    XCTAssertTrue(sut.isMotionAvailable)
  }

  func testIsMotionAvailable_WhenNotAvailable_ReturnsFalse() {
    mockMotionProvider.isDeviceMotionAvailable = false

    XCTAssertFalse(sut.isMotionAvailable)
  }

  // MARK: - Start Tests

  func testStart_WhenMotionNotAvailable_CallsErrorDelegate() {
    mockMotionProvider.isDeviceMotionAvailable = false
    let expectation = expectation(description: "Error delegate called")

    mockDelegate.onDidFailWithError = { _ in
      expectation.fulfill()
    }

    sut.start()

    waitForExpectations(timeout: 1.0)

    XCTAssertTrue(mockDelegate.didFailWithErrorCalled)
    XCTAssertFalse(sut.isCollecting)
    XCTAssertFalse(mockMotionProvider.startCalled)
  }

  func testStart_WhenAlreadyCollecting_CallsErrorDelegate() {
    let startExpectation = expectation(description: "Start delegate called")
    let errorExpectation = expectation(description: "Error delegate called")

    mockDelegate.onDidStartCollecting = { _ in
      startExpectation.fulfill()
    }

    sut.start()
    wait(for: [startExpectation], timeout: 1.0)

    mockDelegate.reset()
    mockDelegate.onDidFailWithError = { _ in
      errorExpectation.fulfill()
    }

    sut.start()

    wait(for: [errorExpectation], timeout: 1.0)
    XCTAssertTrue(mockDelegate.didFailWithErrorCalled)
  }

  func testStart_Success_CallsStartDelegate() {
    let expectation = expectation(description: "Start delegate called")

    mockDelegate.onDidStartCollecting = { _ in
      expectation.fulfill()
    }

    sut.start()

    waitForExpectations(timeout: 1.0)

    XCTAssertTrue(mockDelegate.didStartCollectingCalled)
    XCTAssertTrue(mockMotionProvider.startCalled)
    XCTAssertTrue(sut.isCollecting)
    XCTAssertEqual(mockMotionProvider.deviceMotionUpdateInterval, 0.016)
  }

  // MARK: - Motion Data Collection Tests

  func testMotionDataCollection_CreatesCorrectRecord() {
    let startExpectation = expectation(description: "Start collecting")
    let recordExpectation = expectation(description: "Receive record")

    mockDelegate.onDidStartCollecting = { _ in
      startExpectation.fulfill()
    }

    mockDelegate.onDidReceiveRecord = { _, _, _ in
      recordExpectation.fulfill()
    }

    sut.start()
    wait(for: [startExpectation], timeout: 1.0)

    mockMotionProvider.simulateMotionUpdate(timestamp: 1.5)

    wait(for: [recordExpectation], timeout: 1.0)

    XCTAssertEqual(sut.records.count, 1)
    XCTAssertTrue(mockDelegate.didReceiveRecordCalled)
    XCTAssertEqual(mockDelegate.lastTotalRecords, 1)

    let record = sut.records.first!
    XCTAssertEqual(record.timestamp, 1.5)
    XCTAssertEqual(record.accX, 10) // 0.1 * 100
    XCTAssertEqual(record.accY, 20) // 0.2 * 100
    XCTAssertEqual(record.accZ, 30) // 0.3 * 100
    XCTAssertEqual(record.accGravX, 40) // 0.4 * 100
    XCTAssertEqual(record.accGravY, 50) // 0.5 * 100
    XCTAssertEqual(record.accGravZ, 60) // 0.6 * 100
    XCTAssertEqual(record.gyroAlpha, 70) // 0.7 * 100
    XCTAssertEqual(record.gyroBeta, 80) // 0.8 * 100
    XCTAssertEqual(record.gyroGamma, 90) // 0.9 * 100
    XCTAssertEqual(record.interval, 0) // UInt16(0.016) = 0
    XCTAssertEqual(record.event, 0x00)
  }

  func testMotionDataCollection_StopsAtLimit() {
    let startExpectation = expectation(description: "Start collecting")
    let stopExpectation = expectation(description: "Stop collecting")
    let recordsExpectation = expectation(description: "Collect records")

    mockDelegate.onDidStartCollecting = { _ in
      startExpectation.fulfill()
    }

    mockDelegate.onDidStopCollecting = { _ in
      stopExpectation.fulfill()
    }

    mockDelegate.onDidCollectRecords = { _, _ in
      recordsExpectation.fulfill()
    }

    sut.start()
    wait(for: [startExpectation], timeout: 1.0)

    for i in 1...5 {
      mockMotionProvider.simulateMotionUpdate(timestamp: Double(i))
    }

    wait(for: [stopExpectation, recordsExpectation], timeout: 2.0)

    XCTAssertTrue(mockMotionProvider.stopCalled)
    XCTAssertTrue(mockDelegate.didStopCollectingCalled)
    XCTAssertTrue(mockDelegate.didCollectRecordsCalled)
    XCTAssertEqual(mockDelegate.collectedRecords.count, 5)
    XCTAssertFalse(sut.isCollecting)
  }

  func testMotionDataCollection_HandlesError() {
    let startExpectation = expectation(description: "Start collecting")
    let errorExpectation = expectation(description: "Error occurred")
    let stopExpectation = expectation(description: "Stop collecting")

    mockDelegate.onDidStartCollecting = { _ in
      startExpectation.fulfill()
    }

    mockDelegate.onDidFailWithError = { _ in
      errorExpectation.fulfill()
    }

    mockDelegate.onDidStopCollecting = { _ in
      stopExpectation.fulfill()
    }

    sut.start()
    wait(for: [startExpectation], timeout: 1.0)

    mockDelegate.reset()
    mockDelegate.onDidFailWithError = { _ in
      errorExpectation.fulfill()
    }
    mockDelegate.onDidStopCollecting = { _ in
      stopExpectation.fulfill()
    }

    let testError = NSError(domain: "TestDomain", code: 42, userInfo: nil)
    mockMotionProvider.simulateError(testError)

    wait(for: [errorExpectation, stopExpectation], timeout: 1.0)

    XCTAssertTrue(mockDelegate.didFailWithErrorCalled)
    if case .motionUpdateError(let error) = mockDelegate.lastError {
      XCTAssertEqual((error as NSError).code, 42)
    } else {
      XCTFail("Expected motionUpdateError")
    }
    XCTAssertTrue(mockDelegate.didStopCollectingCalled)
    XCTAssertFalse(sut.isCollecting)
  }

  // MARK: - Stop Tests

  func testStop_WhenCollecting_StopsAndNotifiesDelegate() {
    let startExpectation = expectation(description: "Start collecting")
    let recordExpectation = expectation(description: "Records received")
    recordExpectation.expectedFulfillmentCount = 2
    let stopExpectation = expectation(description: "Stop collecting")
    let collectExpectation = expectation(description: "Collect records")

    mockDelegate.onDidStartCollecting = { _ in
      startExpectation.fulfill()
    }

    mockDelegate.onDidReceiveRecord = { _, _, _ in
      recordExpectation.fulfill()
    }

    sut.start()
    wait(for: [startExpectation], timeout: 1.0)

    mockMotionProvider.simulateMotionUpdate(timestamp: 1.0)
    mockMotionProvider.simulateMotionUpdate(timestamp: 2.0)

    wait(for: [recordExpectation], timeout: 1.0)

    mockDelegate.reset()
    mockDelegate.onDidStopCollecting = { _ in
      stopExpectation.fulfill()
    }

    mockDelegate.onDidCollectRecords = { _, _ in
      collectExpectation.fulfill()
    }

    sut.stop()

    wait(for: [stopExpectation, collectExpectation], timeout: 1.0)

    XCTAssertTrue(mockMotionProvider.stopCalled)
    XCTAssertTrue(mockDelegate.didStopCollectingCalled)
    XCTAssertTrue(mockDelegate.didCollectRecordsCalled)
    XCTAssertEqual(mockDelegate.collectedRecords.count, 2)
    XCTAssertFalse(sut.isCollecting)
  }

  func testStop_WhenNotCollecting_DoesNothing() {
    sut.stop()

    // Give time for operation to complete
    Thread.sleep(forTimeInterval: 0.1)

    XCTAssertFalse(mockMotionProvider.stopCalled)
    XCTAssertFalse(mockDelegate.didStopCollectingCalled)
    XCTAssertFalse(mockDelegate.didCollectRecordsCalled)
  }

  func testStop_WithNoRecords_DoesNotCallCollectRecordsDelegates() {
    let startExpectation = expectation(description: "Start collecting")
    let stopExpectation = expectation(description: "Stop collecting")

    mockDelegate.onDidStartCollecting = { _ in
      startExpectation.fulfill()
    }

    sut.start()
    wait(for: [startExpectation], timeout: 1.0)

    mockDelegate.reset()
    mockDelegate.onDidStopCollecting = { _ in
      stopExpectation.fulfill()
    }

    sut.stop()

    wait(for: [stopExpectation], timeout: 1.0)

    XCTAssertTrue(mockDelegate.didStopCollectingCalled)
    XCTAssertFalse(mockDelegate.didCollectRecordsCalled)
  }

  // MARK: - Reset Tests

  func testReset_WhenCollecting_StopsAndClearsRecords() {
    let startExpectation = expectation(description: "Start collecting")
    let recordExpectation = expectation(description: "Records received")
    recordExpectation.expectedFulfillmentCount = 2

    mockDelegate.onDidStartCollecting = { _ in
      startExpectation.fulfill()
    }

    mockDelegate.onDidReceiveRecord = { _, _, _ in
      recordExpectation.fulfill()
    }

    sut.start()
    wait(for: [startExpectation], timeout: 1.0)

    mockMotionProvider.simulateMotionUpdate(timestamp: 1.0)
    mockMotionProvider.simulateMotionUpdate(timestamp: 2.0)

    wait(for: [recordExpectation], timeout: 1.0)

    sut.reset()

    // Give time for reset to complete
    Thread.sleep(forTimeInterval: 0.2)

    XCTAssertTrue(sut.records.isEmpty)
    XCTAssertFalse(sut.isCollecting)
    XCTAssertTrue(mockMotionProvider.stopCalled)
  }

  func testReset_WhenNotCollecting_OnlyClearsRecords() {
    let startExpectation = expectation(description: "Start collecting")
    let recordExpectation = expectation(description: "Record received")
    let stopExpectation = expectation(description: "Stop collecting")

    mockDelegate.onDidStartCollecting = { _ in
      startExpectation.fulfill()
    }

    mockDelegate.onDidReceiveRecord = { _, _, _ in
      recordExpectation.fulfill()
    }

    mockDelegate.onDidStopCollecting = { _ in
      stopExpectation.fulfill()
    }

    sut.start()
    wait(for: [startExpectation], timeout: 1.0)

    mockMotionProvider.simulateMotionUpdate(timestamp: 1.0)

    wait(for: [recordExpectation], timeout: 1.0)

    sut.stop()
    wait(for: [stopExpectation], timeout: 1.0)

    let stopCalledBefore = mockMotionProvider.stopCalled

    sut.reset()

    // Give time for reset to complete
    Thread.sleep(forTimeInterval: 0.2)

    XCTAssertTrue(sut.records.isEmpty)
    XCTAssertFalse(sut.isCollecting)
    XCTAssertEqual(mockMotionProvider.stopCalled, stopCalledBefore) // No additional stop call
  }

  // MARK: - Integration Tests

  func testFullCollectionCycle() {
    let startExpectation = expectation(description: "Start collecting")
    let stopExpectation = expectation(description: "Stop collecting")
    let collectExpectation = expectation(description: "Collect records")

    mockDelegate.onDidStartCollecting = { _ in
      startExpectation.fulfill()
    }

    mockDelegate.onDidStopCollecting = { _ in
      stopExpectation.fulfill()
    }

    mockDelegate.onDidCollectRecords = { _, _ in
      collectExpectation.fulfill()
    }

    sut.start()
    wait(for: [startExpectation], timeout: 1.0)

    // Simulate collecting to the limit
    for i in 1...5 {
      mockMotionProvider.simulateMotionUpdate(timestamp: Double(i))
    }

    wait(for: [stopExpectation, collectExpectation], timeout: 2.0)

    XCTAssertFalse(sut.isCollecting)
    XCTAssertTrue(mockDelegate.didStartCollectingCalled)
    XCTAssertTrue(mockDelegate.didStopCollectingCalled)
    XCTAssertTrue(mockDelegate.didCollectRecordsCalled)
    XCTAssertEqual(mockDelegate.collectedRecords.count, 5)
  }

  func testMultipleStartStopCycles() {
    // First cycle
    let startExpectation1 = expectation(description: "Start collecting 1")
    let recordExpectation1 = expectation(description: "Records received 1")
    recordExpectation1.expectedFulfillmentCount = 2
    let stopExpectation1 = expectation(description: "Stop collecting 1")
    let collectExpectation1 = expectation(description: "Collect records 1")

    mockDelegate.onDidStartCollecting = { _ in
      startExpectation1.fulfill()
    }

    mockDelegate.onDidReceiveRecord = { _, _, _ in
      recordExpectation1.fulfill()
    }

    mockDelegate.onDidStopCollecting = { _ in
      stopExpectation1.fulfill()
    }

    mockDelegate.onDidCollectRecords = { _, _ in
      collectExpectation1.fulfill()
    }

    sut.start()
    wait(for: [startExpectation1], timeout: 1.0)

    mockMotionProvider.simulateMotionUpdate(timestamp: 1.0)
    mockMotionProvider.simulateMotionUpdate(timestamp: 2.0)

    wait(for: [recordExpectation1], timeout: 1.0)

    sut.stop()

    wait(for: [stopExpectation1, collectExpectation1], timeout: 1.0)

    XCTAssertEqual(mockDelegate.collectedRecords.count, 2)

    // Reset for second cycle
    sut.reset()
    Thread.sleep(forTimeInterval: 0.2)

    mockDelegate.reset()
    mockMotionProvider.stopCalled = false

    // Second cycle
    let startExpectation2 = expectation(description: "Start collecting 2")
    let recordExpectation2 = expectation(description: "Record received 2")
    let stopExpectation2 = expectation(description: "Stop collecting 2")
    let collectExpectation2 = expectation(description: "Collect records 2")

    mockDelegate.onDidStartCollecting = { _ in
      startExpectation2.fulfill()
    }

    mockDelegate.onDidReceiveRecord = { _, _, _ in
      recordExpectation2.fulfill()
    }

    mockDelegate.onDidStopCollecting = { _ in
      stopExpectation2.fulfill()
    }

    mockDelegate.onDidCollectRecords = { _, _ in
      collectExpectation2.fulfill()
    }

    sut.start()
    wait(for: [startExpectation2], timeout: 1.0)

    mockMotionProvider.simulateMotionUpdate(timestamp: 3.0)

    wait(for: [recordExpectation2], timeout: 1.0)

    sut.stop()

    wait(for: [stopExpectation2, collectExpectation2], timeout: 1.0)

    XCTAssertEqual(mockDelegate.collectedRecords.count, 1)
  }

  // MARK: - Thread Safety Tests

  func testConcurrentAccess() {
    let startExpectation = expectation(description: "Start collecting")
    let stopExpectation = expectation(description: "Stop collecting")

    mockDelegate.onDidStartCollecting = { _ in
      startExpectation.fulfill()
    }

    mockDelegate.onDidStopCollecting = { _ in
      stopExpectation.fulfill()
    }

    let group = DispatchGroup()

    group.enter()
    DispatchQueue.global().async {
      self.sut.start()
      group.leave()
    }

    group.enter()
    DispatchQueue.global().asyncAfter(deadline: .now() + 0.1) {
      self.mockMotionProvider.simulateMotionUpdate(timestamp: 1.0)
      group.leave()
    }

    group.enter()
    DispatchQueue.global().asyncAfter(deadline: .now() + 0.2) {
      self.sut.stop()
      group.leave()
    }

    group.wait()
    wait(for: [startExpectation, stopExpectation], timeout: 2.0)

    // Verify no crash and consistent state
    XCTAssertFalse(sut.isCollecting)
  }
}
