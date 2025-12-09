import Foundation

// MARK: - MetadataHeader

public class MotionHeader {

  // MARK: Lifecycle

  public init(
    formatVersion: UInt8 = 0x01,
    transactionCode: Int = 0,
    processId: Int = 0,
    timestamp: Int = Int(Date().timeIntervalSince1970),
    recordsCount: Int)
  {
    self.formatVersion = formatVersion
    self.transactionCode = Int32(transactionCode)
    self.processId = Int32(processId)
    self.timestamp = Int32(timestamp)
    self.recordsCount = Int32(recordsCount)
  }

  // MARK: Public

  public var formatVersion: UInt8
  public var transactionCode: Int32
  public var processId: Int32
  public var timestamp: Int32
  public var recordsCount: Int32

  public func parse(into data: inout Data) {
    withUnsafePointer(to: &formatVersion) { data.append(UnsafeBufferPointer(start: $0, count: 1)) }
    withUnsafePointer(to: &transactionCode) { data.append(UnsafeBufferPointer(start: $0, count: 1)) }
    withUnsafePointer(to: &processId) { data.append(UnsafeBufferPointer(start: $0, count: 1)) }
    withUnsafePointer(to: &timestamp) { data.append(UnsafeBufferPointer(start: $0, count: 1)) }
    withUnsafePointer(to: &recordsCount) { data.append(UnsafeBufferPointer(start: $0, count: 1)) }
  }
}
