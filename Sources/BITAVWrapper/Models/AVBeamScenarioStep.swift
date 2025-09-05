import Foundation

public enum AVBeamScenarioStep: Int, CaseIterable {
  case none = 0
  case qrCode = 1
  case idRecognition = 2
  case scanDocument = 3
  case signDocument = 4
  case faceCapture = 5
  case faceVerification = 6
  case dataEncryption = 7
  case dataDecryption = 8
  case recordDocument = 9

  public init?(_ value: Int) {
    self.init(rawValue: value)
  }
}
