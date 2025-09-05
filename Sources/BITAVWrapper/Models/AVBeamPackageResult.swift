import Foundation

public struct AVBeamPackageResult {

  init(data: AVBeamPackageData, files: [AVBeamFile]) {
    self.data = data
    self.files = files
  }

  public let data: AVBeamPackageData
  public let files: [AVBeamFile]
}
