import CoreMotion
import XCTest
@testable import BITAVWrapper

class MotionMetadataTests: XCTestCase {

  func testAsData_CombinesHeaderAndRecords() {
    let header = MotionHeader(transactionCode: 123, recordsCount: 2)
    let records = [
      MotionRecord(
        timestamp: 1.0,
        accX: 1, accY: 2, accZ: 3,
        accGravX: 4, accGravY: 5, accGravZ: 6,
        gyroAlpha: 7, gyroBeta: 8, gyroGamma: 9,
        interval: 10, event: 11),
      MotionRecord(
        timestamp: 2.0,
        accX: 10, accY: 20, accZ: 30,
        accGravX: 40, accGravY: 50, accGravZ: 60,
        gyroAlpha: 70, gyroBeta: 80, gyroGamma: 90,
        interval: 100, event: 110),
    ]

    let metadata = MotionMetadata(header: header, records: records)

    let data = metadata.asData()

    // Header: 17 bytes (1 + 4 + 4 + 4 + 4) + 2 records * 44 bytes = 105 bytes
    XCTAssertEqual(data.count, 105)

    // Verify format version (first byte)
    XCTAssertEqual(data[0], 0x01)

    // Verify transaction code (bytes 1-4, Int32)
    let transactionCode = data.withUnsafeBytes { bytes in
      bytes.loadUnaligned(fromByteOffset: 1, as: Int32.self)
    }
    XCTAssertEqual(transactionCode, 123)

    // Verify records count in header (bytes 13-16)
    let recordsCount = data.withUnsafeBytes { bytes in
      bytes.loadUnaligned(fromByteOffset: 13, as: Int32.self)
    }
    XCTAssertEqual(recordsCount, 2)
  }

  func testAsData_VerifyRecordData() {
    let header = MotionHeader(transactionCode: 1234, recordsCount: 1)
    let record = MotionRecord(
      timestamp: 1.5,
      accX: 2.5, accY: 3.5, accZ: 4.5,
      accGravX: 5.5, accGravY: 6.5, accGravZ: 7.5,
      gyroAlpha: 8.5, gyroBeta: 9.5, gyroGamma: 10.5,
      interval: 16, event: 0)

    let metadata = MotionMetadata(header: header, records: [record])
    let data = metadata.asData()

    // Total: 17 (header) + 44 (record) = 61 bytes
    XCTAssertEqual(data.count, 61)

    // Verify first record starts at byte 17
    let recordTimestamp = data.withUnsafeBytes { bytes in
      bytes.loadUnaligned(fromByteOffset: 17, as: Float32.self)
    }
    XCTAssertEqual(recordTimestamp, 1.5, accuracy: 0.001)

    // Verify accX at byte 21
    let accX = data.withUnsafeBytes { bytes in
      bytes.loadUnaligned(fromByteOffset: 21, as: Float32.self)
    }
    XCTAssertEqual(accX, 2.5, accuracy: 0.001)
  }
}
