import Foundation

public protocol AVBeamNfcDelegate: AnyObject {
  func didCompleteNfcScan(packageResult: AVBeamPackageResult)
}
