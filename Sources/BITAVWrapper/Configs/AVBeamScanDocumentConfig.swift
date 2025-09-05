import Foundation

// MARK: - AVBeamScanDocumentConfig

public struct AVBeamScanDocumentConfig {

  // MARK: Lifecycle

  public init(
    processId: String = "",
    files: [AVBeamFile] = [],
    scanFrame: CGRect,
    timeout: TimeInterval = 15,
    isDocumentSideChangeNotificationExpected: Bool = false)
  {
    self.processId = processId
    self.files = files
    self.scanFrame = scanFrame
    self.timeout = timeout
    self.isDocumentSideChangeNotificationExpected = isDocumentSideChangeNotificationExpected
  }

  // MARK: Public

  public let processId: String
  public let files: [AVBeamFile]
  public let scanFrame: CGRect
  public let timeout: TimeInterval
  public let isDocumentSideChangeNotificationExpected: Bool

  // MARK: Internal

  let xmlData = ""
  let transactionCode = ""
}
