import CoreMotion
@testable import BITAVWrapper

class MockMotionDataProvider: MotionDataProvider {
  var isDeviceMotionAvailable = true
  var deviceMotionUpdateInterval: TimeInterval = 0.016
  var startCalled = false
  var stopCalled = false
  var handler: CMDeviceMotionHandler?
  var updateQueue: OperationQueue?

  func startDeviceMotionUpdates(to queue: OperationQueue, withHandler handler: @escaping CMDeviceMotionHandler) {
    startCalled = true
    self.handler = handler
    updateQueue = queue
  }

  func stopDeviceMotionUpdates() {
    stopCalled = true
    handler = nil
  }

  func simulateMotionUpdate(
    timestamp: TimeInterval = 1.0,
    userAcceleration: CMAcceleration = CMAcceleration(x: 0.1, y: 0.2, z: 0.3),
    gravity: CMAcceleration = CMAcceleration(x: 0.4, y: 0.5, z: 0.6),
    rotationRate: CMRotationRate = CMRotationRate(x: 0.7, y: 0.8, z: 0.9))
  {
    let mockData = MockDeviceMotion(
      timestamp: timestamp,
      userAcceleration: userAcceleration,
      gravity: gravity,
      rotationRate: rotationRate)

    // Dispatch to the operation queue like the real CMMotionManager does
    if let queue = updateQueue, let handler = handler {
      queue.addOperation {
        handler(mockData, nil)
      }
    }
  }

  func simulateError(_ error: Error? = nil) {
    let errorToSend = error ?? NSError(domain: "TestError", code: 1, userInfo: [NSLocalizedDescriptionKey: "Test error"])

    // Dispatch to the operation queue like the real CMMotionManager does
    if let queue = updateQueue, let handler = handler {
      queue.addOperation {
        handler(nil, errorToSend)
      }
    }
  }
}
