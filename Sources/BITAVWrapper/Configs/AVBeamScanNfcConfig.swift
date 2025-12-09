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
    saveAdditionalFiles: Bool = false,
    saveAuthResult: Bool = false,
    saveNfcResult: Bool = false,
    processId: String = "",
    transactionId: String = "")
  {
    self.packageData = packageData
    self.url = url
    self.language = language
    self.authToken = authToken
    self.showProgress = showProgress
    self.popupMessages = popupMessages
    self.saveAdditionalFiles = saveAdditionalFiles
    self.saveAuthResult = saveAuthResult
    self.saveNfcResult = saveNfcResult
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

  let saveAdditionalFiles: Bool
  let saveAuthResult: Bool
  let saveNfcResult: Bool

  let processId: String
  let transactionId: String
}
