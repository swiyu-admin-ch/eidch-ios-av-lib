import CoreMotion
@testable import BITAVWrapper

class MockDeviceMotion: CMDeviceMotion {

  // MARK: Lifecycle

  init(
    timestamp: TimeInterval,
    userAcceleration: CMAcceleration,
    gravity: CMAcceleration,
    rotationRate: CMRotationRate)
  {
    _timestamp = timestamp
    _userAcceleration = userAcceleration
    _gravity = gravity
    _rotationRate = rotationRate
    super.init()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  // MARK: Internal

  override var timestamp: TimeInterval { _timestamp }
  override var userAcceleration: CMAcceleration { _userAcceleration }
  override var gravity: CMAcceleration { _gravity }
  override var rotationRate: CMRotationRate { _rotationRate }

  // MARK: Private

  private let _timestamp: TimeInterval
  private let _userAcceleration: CMAcceleration
  private let _gravity: CMAcceleration
  private let _rotationRate: CMRotationRate

}
