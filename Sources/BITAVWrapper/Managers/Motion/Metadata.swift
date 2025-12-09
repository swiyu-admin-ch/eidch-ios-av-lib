import Foundation

public struct MotionMetadata {

  // MARK: Lifecycle

  public init(header: MotionHeader, records: [MotionRecord]) {
    self.header = header
    self.records = records
  }

  // MARK: Internal

  var header: MotionHeader
  var records: [MotionRecord]

  public func asData() -> Data {
    var data = Data()

    header.parse(into: &data)

    for record in records {
      record.parse(into: &data)
    }

    return data
  }
}
