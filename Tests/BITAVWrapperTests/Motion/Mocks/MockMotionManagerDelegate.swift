import CoreMotion
@testable import BITAVWrapper

class MockMotionManagerDelegate: MotionManagerDelegate {
  // Track all delegate calls
  var didFailWithErrorCalled = false
  var didCollectRecordsCalled = false
  var didReceiveRecordCalled = false
  var didStartCollectingCalled = false
  var didStopCollectingCalled = false

  // Store received data
  var lastError: MotionManagerError?
  var collectedRecords: [MotionRecord] = []
  var lastReceivedRecord: MotionRecord?
  var lastTotalRecords = 0

  // Closure properties for expectation fulfillment
  var onDidFailWithError: ((MotionManagerError) -> Void)?
  var onDidCollectRecords: ((MotionManager, [MotionRecord]) -> Void)?
  var onDidReceiveRecord: ((MotionManager, MotionRecord, Int) -> Void)?
  var onDidStartCollecting: ((MotionManager) -> Void)?
  var onDidStopCollecting: ((MotionManager) -> Void)?

  func motionManager(_ manager: MotionManager, didFailWithError error: MotionManagerError) {
    didFailWithErrorCalled = true
    lastError = error
    onDidFailWithError?(error)
  }

  func motionManager(_ manager: MotionManager, didCollectRecords records: [MotionRecord]) {
    didCollectRecordsCalled = true
    collectedRecords = records
    onDidCollectRecords?(manager, records)
  }

  func motionManager(_ manager: MotionManager, didReceiveRecord record: MotionRecord, totalRecords: Int) {
    didReceiveRecordCalled = true
    lastReceivedRecord = record
    lastTotalRecords = totalRecords
    onDidReceiveRecord?(manager, record, totalRecords)
  }

  func motionManagerDidStartCollecting(_ manager: MotionManager) {
    didStartCollectingCalled = true
    onDidStartCollecting?(manager)
  }

  func motionManagerDidStopCollecting(_ manager: MotionManager) {
    didStopCollectingCalled = true
    onDidStopCollecting?(manager)
  }

  func reset() {
    didFailWithErrorCalled = false
    didCollectRecordsCalled = false
    didReceiveRecordCalled = false
    didStartCollectingCalled = false
    didStopCollectingCalled = false

    lastError = nil
    collectedRecords = []
    lastReceivedRecord = nil
    lastTotalRecords = 0

    onDidFailWithError = nil
    onDidCollectRecords = nil
    onDidReceiveRecord = nil
    onDidStartCollecting = nil
    onDidStopCollecting = nil
  }
}
