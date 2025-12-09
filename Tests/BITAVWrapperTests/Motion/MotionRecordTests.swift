import CoreMotion
import XCTest
@testable import BITAVWrapper

class MotionRecordTests: XCTestCase {

  func testInitFromDeviceMotion() {
    let mockMotion = MockDeviceMotion(
      timestamp: 100.5,
      userAcceleration: CMAcceleration(x: 0.1, y: 0.2, z: 0.3),
      gravity: CMAcceleration(x: 0.4, y: 0.5, z: 0.6),
      rotationRate: CMRotationRate(x: 0.7, y: 0.8, z: 0.9))

    let record = MotionRecord(from: mockMotion, coefficient: 100, interval: 16, event: 0x01)

    XCTAssertEqual(record.timestamp, 100.5)
    XCTAssertEqual(record.accX, 10)
    XCTAssertEqual(record.accY, 20)
    XCTAssertEqual(record.accZ, 30)
    XCTAssertEqual(record.accGravX, 40)
    XCTAssertEqual(record.accGravY, 50)
    XCTAssertEqual(record.accGravZ, 60)
    XCTAssertEqual(record.gyroAlpha, 70)
    XCTAssertEqual(record.gyroBeta, 80)
    XCTAssertEqual(record.gyroGamma, 90)
    XCTAssertEqual(record.interval, 16)
    XCTAssertEqual(record.event, 0x01)
  }

  func testParseToBinaryData() {
    let record = MotionRecord(
      timestamp: 1.5,
      accX: 2.0, accY: 3.0, accZ: 4.0,
      accGravX: 5.0, accGravY: 6.0, accGravZ: 7.0,
      gyroAlpha: 8.0, gyroBeta: 9.0, gyroGamma: 10.0,
      interval: 16, event: 0x00)

    var data = Data()
    record.parse(into: &data)

    XCTAssertEqual(data.count, 44) // 10 Float32 (40 bytes) + 2 UInt16 (4 bytes)

    // Verify first value (timestamp)
    let timestamp = data.withUnsafeBytes { bytes in
      bytes.loadUnaligned(fromByteOffset: 0, as: Float32.self)
    }
    XCTAssertEqual(timestamp, 1.5)
  }

  func testCodable() throws {
    let original = MotionRecord(
      timestamp: 1.5,
      accX: 2.0, accY: 3.0, accZ: 4.0,
      accGravX: 5.0, accGravY: 6.0, accGravZ: 7.0,
      gyroAlpha: 8.0, gyroBeta: 9.0, gyroGamma: 10.0,
      interval: 16, event: 0x00)

    let encoded = try JSONEncoder().encode(original)
    let decoded = try JSONDecoder().decode(MotionRecord.self, from: encoded)

    XCTAssertEqual(decoded.timestamp, original.timestamp)
    XCTAssertEqual(decoded.accX, original.accX)
    XCTAssertEqual(decoded.interval, original.interval)
  }
}
