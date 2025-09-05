import Foundation

// MARK: - AVBeamScanNfcConfig

public struct AVBeamScanNfcConfig {

  // MARK: Lifecycle

  public init(
    packageData: AVBeamPackageData,
    url: URL,
    saveAdditionalFiles: Bool = false,
    saveAuthResult: Bool = false,
    saveNfcResult: Bool = false,
    processId: String = "",
    transactionId: String = "")
  {
    self.packageData = packageData
    self.url = url
    self.saveAdditionalFiles = saveAdditionalFiles
    self.saveAuthResult = saveAuthResult
    self.saveNfcResult = saveNfcResult
    self.processId = processId
    self.transactionId = transactionId
  }

  // MARK: Internal

  let packageData: AVBeamPackageData
  let url: URL

  let saveAdditionalFiles: Bool
  let saveAuthResult: Bool
  let saveNfcResult: Bool

  let processId: String
  let transactionId: String
}
