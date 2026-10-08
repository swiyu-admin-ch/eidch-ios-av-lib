import Foundation

public struct AVBeamScanNfcConfig: Codable, Equatable {

  // MARK: Lifecycle

  public init(
    packageData: AVBeamPackageData,
    url: URL,
    language: String = "en",
    authToken: String? = nil,
    showProgress: Bool = true,
    popupMessages: [String: String] = [:],
    saveDebugInfo: Bool = true,
    processId: String = "",
    transactionId: String = "")
  {
    self.packageData = packageData
    self.url = url
    self.language = language
    self.authToken = authToken
    self.showProgress = showProgress
    self.popupMessages = popupMessages
    self.saveDebugInfo = saveDebugInfo
    self.processId = processId
    self.transactionId = transactionId
  }

  // MARK: Internal

  let packageData: AVBeamPackageData
  let url: URL
  let language: String
  let authToken: String?
  let showProgress: Bool
  let popupMessages: [String: String]

  let saveDebugInfo: Bool

  let processId: String
  let transactionId: String
}
