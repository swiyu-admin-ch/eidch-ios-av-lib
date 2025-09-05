import Foundation

public struct AVBeamPackageData {

  // MARK: Lifecycle

  public init(
    extractedData: [Int: Any] = [:],
    extractedDataDrivingLicense: [Int: Any] = [:],
    errorType: Int = 0,
    errorCode: Int = 0,
    nfcErrorCode: Int = 0,
    errorCodeList: [Int] = [],
    status: Int = 0,
    activeScenario: Int = 0,
    files: [AVBeamFile])
  {
    self.extractedData = extractedData
    self.extractedDataDrivingLicense = extractedDataDrivingLicense
    self.errorType = errorType
    self.errorCode = errorCode
    self.nfcErrorCode = nfcErrorCode
    self.errorCodeList = errorCodeList
    self.status = status
    self.activeScenario = activeScenario
    self.files = files
  }

  // MARK: Public

  public var extractedData: [Int: Any]
  public var extractedDataDrivingLicense: [Int: Any]
  public var errorType: Int
  public var errorCode: Int
  public var nfcErrorCode: Int
  public var errorCodeList: [Int]
  public var status: Int
  public var activeScenario: Int
  public var files: [AVBeamFile]

}
