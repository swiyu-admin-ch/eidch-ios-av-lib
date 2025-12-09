import CoreMotion

// MARK: - MotionDataProvider

public protocol MotionDataProvider {
  var isDeviceMotionAvailable: Bool { get }
  var deviceMotionUpdateInterval: TimeInterval { get set }
  func startDeviceMotionUpdates(to queue: OperationQueue, withHandler handler: @escaping CMDeviceMotionHandler)
  func stopDeviceMotionUpdates()
}

// MARK: - CMMotionManager + MotionDataProvider

extension CMMotionManager: MotionDataProvider {}
