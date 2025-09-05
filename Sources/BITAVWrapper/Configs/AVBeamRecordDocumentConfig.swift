import Foundation

public struct AVBeamRecordDocumentConfig {
  // MARK: Lifecycle

  public init(files: [AVBeamFile] = [], timeout: TimeInterval = 30) {
    self.files = files
    self.timeout = timeout
  }

  public let files: [AVBeamFile]
  public let timeout: TimeInterval
}
