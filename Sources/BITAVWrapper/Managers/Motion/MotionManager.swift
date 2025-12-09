import CoreMotion
import Foundation

// MARK: - MotionManager

final class MotionManager {

  // MARK: Lifecycle

  init(
    motionDataProvider: MotionDataProvider = CMMotionManager(),
    recordsLimit: Int = 100,
    coefficient: Double = 100,
    updateInterval: TimeInterval = 0.016)
  {
    self.motionDataProvider = motionDataProvider
    self.recordsLimit = recordsLimit
    self.coefficient = coefficient
    self.updateInterval = updateInterval

    dispatchQueue = DispatchQueue(label: "ch.admin.swiyu.motionmanager.dispatchQueue")
    queue = OperationQueue()
    queue.name = "ch.admin.swiyu.motionmanager.queue"
    queue.maxConcurrentOperationCount = 1
    queue.underlyingQueue = dispatchQueue
  }

  // MARK: Internal

  private(set) var records = [MotionRecord]()
  private(set) var isCollecting = false

  var recordsLimit: Int

  weak var delegate: MotionManagerDelegate?

  var isMotionAvailable: Bool {
    motionDataProvider.isDeviceMotionAvailable
  }

  func start() {
    queue.addOperation { [weak self] in
      guard let self else { return }
      _start()
    }
  }

  func stop() {
    queue.addOperation { [weak self] in
      guard let self else { return }
      _stop()
    }
  }

  func reset() {
    queue.addOperation { [weak self] in
      guard let self else { return }
      _reset()
    }
  }

  // MARK: Private

  private let motionDataProvider: MotionDataProvider
  private let dispatchQueue: DispatchQueue
  private let queue: OperationQueue
  private let coefficient: Double
  private let updateInterval: TimeInterval

  private func _start() {
    assertOnQueue()

    guard isMotionAvailable else {
      notifyDelegateOnMain { [weak self] in
        guard let self else { return }
        delegate?.motionManager(self, didFailWithError: .motionDataNotAvailable)
      }
      return
    }

    guard !isCollecting else {
      notifyDelegateOnMain { [weak self] in
        guard let self else { return }
        delegate?.motionManager(self, didFailWithError: .alreadyCollecting)
      }
      return
    }

    isCollecting = true

    notifyDelegateOnMain { [weak self] in
      guard let self else { return }
      delegate?.motionManagerDidStartCollecting(self)
    }

    startMotionUpdates()
  }

  private func _stop() {
    assertOnQueue()

    guard isCollecting else { return }

    motionDataProvider.stopDeviceMotionUpdates()
    isCollecting = false

    let recordsCopy = records.isEmpty ? nil : records

    notifyDelegateOnMain { [weak self] in
      guard let self else { return }
      delegate?.motionManagerDidStopCollecting(self)

      if let recordsCopy {
        delegate?.motionManager(self, didCollectRecords: recordsCopy)
      }
    }
  }

  private func _reset() {
    assertOnQueue()

    if isCollecting {
      _stop()
    }
    records.removeAll()
  }

  private func startMotionUpdates() {
    assertOnQueue()

    var localMotionProvider = motionDataProvider
    localMotionProvider.deviceMotionUpdateInterval = updateInterval

    localMotionProvider.startDeviceMotionUpdates(to: queue) { [weak self] data, error in
      guard let self else { return }
      handleMotionUpdate(data: data, error: error)
    }
  }

  private func handleMotionUpdate(data: CMDeviceMotion?, error: Error?) {
    assertOnQueue()

    if let error {
      notifyDelegateOnMain { [weak self] in
        guard let self else { return }
        delegate?.motionManager(self, didFailWithError: .motionUpdateError(error))
      }
      _stop()
      return
    }

    guard let data else { return }
    guard isCollecting else { return }

    let record = MotionRecord(from: data, coefficient: coefficient, interval: UInt16(updateInterval))
    records.append(record)

    let totalCount = records.count

    notifyDelegateOnMain { [weak self] in
      guard let self else { return }
      delegate?.motionManager(self, didReceiveRecord: record, totalRecords: totalCount)
    }

    if totalCount >= recordsLimit {
      _stop()
    }
  }

  // MARK: - Thread Safety Helpers

  private func assertOnQueue() {
    dispatchPrecondition(condition: .onQueue(dispatchQueue))
  }

  private func notifyDelegateOnMain(_ block: @escaping () -> Void) {
    if Thread.isMainThread {
      block()
    } else {
      DispatchQueue.main.async(execute: block)
    }
  }
}

// MARK: - MotionManagerError

enum MotionManagerError: LocalizedError {
  case motionDataNotAvailable
  case alreadyCollecting
  case motionUpdateError(Error)

  var errorDescription: String? {
    switch self {
    case .motionDataNotAvailable:
      "Motion data is not available on this device"
    case .alreadyCollecting:
      "Motion data collection is already in progress"
    case .motionUpdateError(let error):
      "Motion update failed: \(error.localizedDescription)"
    }
  }
}
