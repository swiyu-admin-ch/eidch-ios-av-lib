import CoreMotion
import XCTest
@testable import BITAVWrapper

class MotionHeaderTests: XCTestCase {

  func testDefaultInitialization() {
    let header = MotionHeader(recordsCount: 10)

    XCTAssertEqual(header.formatVersion, 0x01)
    XCTAssertEqual(header.transactionCode, 0)
    XCTAssertEqual(header.processId, 0)
    XCTAssertEqual(header.recordsCount, 10)
    XCTAssertGreaterThan(header.timestamp, 0)
  }

  func testCustomInitialization() {
    let header = MotionHeader(
      formatVersion: 0x02,
      transactionCode: 999,
      processId: 42,
      timestamp: 1234567890,
      recordsCount: 5)

    XCTAssertEqual(header.formatVersion, 0x02)
    XCTAssertEqual(header.transactionCode, 999)
    XCTAssertEqual(header.processId, 42)
    XCTAssertEqual(header.timestamp, 1234567890)
    XCTAssertEqual(header.recordsCount, 5)
  }

  func testParseToBinaryData() {
    let header = MotionHeader(
      formatVersion: 0x03,
      transactionCode: 111,
      processId: 222,
      timestamp: 333,
      recordsCount: 444)

    var data = Data()
    header.parse(into: &data)

    XCTAssertEqual(data.count, 17) // 1 + 4 + 4 + 4 + 4

    // Verify format version
    XCTAssertEqual(data[0], 0x03)

    // Verify transaction code (Int32)
    let transactionCode = data.withUnsafeBytes { bytes in
      bytes.loadUnaligned(fromByteOffset: 1, as: Int32.self)
    }
    XCTAssertEqual(transactionCode, 111)

    // Verify processId
    let processId = data.withUnsafeBytes { bytes in
      bytes.loadUnaligned(fromByteOffset: 5, as: Int32.self)
    }
    XCTAssertEqual(processId, 222)

    // Verify timestamp
    let timestamp = data.withUnsafeBytes { bytes in
      bytes.loadUnaligned(fromByteOffset: 9, as: Int32.self)
    }
    XCTAssertEqual(timestamp, 333)

    // Verify recordsCount
    let recordsCount = data.withUnsafeBytes { bytes in
      bytes.loadUnaligned(fromByteOffset: 13, as: Int32.self)
    }
    XCTAssertEqual(recordsCount, 444)
  }

}
