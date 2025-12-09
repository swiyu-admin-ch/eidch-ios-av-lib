import Foundation
public struct AVBeamPackageData: Codable, Equatable {

  // MARK: Lifecycle

  public init(
    extractedData: [Int: String],
    extractedDataDrivingLicense: [Int: String]? = nil,
    errorType: AVBeamPackageErrorType = .none,
    errorCode: AVBeamError = .none,
    errorCodes: [AVBeamError] = [],
    status: AVBeamNotification = .initialized,
    activeScenario: AVBeamScenarioStep = .none,
    files: [AVBeamFile] = [])
  {
    self.extractedData = extractedData
    self.extractedDataDrivingLicense = extractedDataDrivingLicense
    self.errorType = errorType
    self.errorCode = errorCode
    self.errorCodes = errorCodes
    self.status = status
    self.activeScenario = activeScenario
    self.files = files
  }

  // MARK: Public

  public let extractedData: [Int: String]
  public let extractedDataDrivingLicense: [Int: String]?
  public let errorType: AVBeamPackageErrorType
  public let errorCode: AVBeamError
  public let errorCodes: [AVBeamError]
  public let status: AVBeamNotification
  public let activeScenario: AVBeamScenarioStep
  public let files: [AVBeamFile]

}
