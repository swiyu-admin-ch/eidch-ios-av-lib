import CoreMotion
import Foundation

public class MotionRecord: Codable {

  // MARK: Lifecycle

  public init(
    timestamp: Float32,
    accX: Float32,
    accY: Float32,
    accZ: Float32,
    accGravX: Float32,
    accGravY: Float32,
    accGravZ: Float32,
    gyroAlpha: Float32,
    gyroBeta: Float32,
    gyroGamma: Float32,
    interval: UInt16,
    event: UInt16)
  {
    self.timestamp = timestamp
    self.accX = accX
    self.accY = accY
    self.accZ = accZ
    self.accGravX = accGravX
    self.accGravY = accGravY
    self.accGravZ = accGravZ
    self.gyroAlpha = gyroAlpha
    self.gyroBeta = gyroBeta
    self.gyroGamma = gyroGamma
    self.interval = interval
    self.event = event
  }

  public init(from deviceMotion: CMDeviceMotion, coefficient: Double = 100, interval: UInt16 = 16, event: UInt16 = 0x00) {
    timestamp = Float32(deviceMotion.timestamp)
    accX = Float32(deviceMotion.userAcceleration.x * coefficient)
    accY = Float32(deviceMotion.userAcceleration.y * coefficient)
    accZ = Float32(deviceMotion.userAcceleration.z * coefficient)
    accGravX = Float32(deviceMotion.gravity.x * coefficient)
    accGravY = Float32(deviceMotion.gravity.y * coefficient)
    accGravZ = Float32(deviceMotion.gravity.z * coefficient)
    gyroAlpha = Float32(deviceMotion.rotationRate.x * coefficient)
    gyroBeta = Float32(deviceMotion.rotationRate.y * coefficient)
    gyroGamma = Float32(deviceMotion.rotationRate.z * coefficient)
    self.interval = interval
    self.event = event
  }

  // MARK: Public

  public var timestamp: Float32
  public var accX: Float32
  public var accY: Float32
  public var accZ: Float32
  public var accGravX: Float32
  public var accGravY: Float32
  public var accGravZ: Float32
  public var gyroAlpha: Float32
  public var gyroBeta: Float32
  public var gyroGamma: Float32
  public var interval: UInt16
  public var event: UInt16

  public func parse(into data: inout Data) {
    withUnsafePointer(to: timestamp) { data.append(UnsafeBufferPointer(start: $0, count: 1)) }
    withUnsafePointer(to: accX) { data.append(UnsafeBufferPointer(start: $0, count: 1)) }
    withUnsafePointer(to: accY) { data.append(UnsafeBufferPointer(start: $0, count: 1)) }
    withUnsafePointer(to: accZ) { data.append(UnsafeBufferPointer(start: $0, count: 1)) }
    withUnsafePointer(to: accGravX) { data.append(UnsafeBufferPointer(start: $0, count: 1)) }
    withUnsafePointer(to: accGravY) { data.append(UnsafeBufferPointer(start: $0, count: 1)) }
    withUnsafePointer(to: accGravZ) { data.append(UnsafeBufferPointer(start: $0, count: 1)) }
    withUnsafePointer(to: gyroAlpha) { data.append(UnsafeBufferPointer(start: $0, count: 1)) }
    withUnsafePointer(to: gyroBeta) { data.append(UnsafeBufferPointer(start: $0, count: 1)) }
    withUnsafePointer(to: gyroGamma) { data.append(UnsafeBufferPointer(start: $0, count: 1)) }
    withUnsafePointer(to: interval) { data.append(UnsafeBufferPointer(start: $0, count: 1)) }
    withUnsafePointer(to: event) { data.append(UnsafeBufferPointer(start: $0, count: 1)) }
  }

}
