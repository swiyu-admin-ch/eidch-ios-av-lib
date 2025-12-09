import Foundation

public struct AVBeamPackageResult: Codable, Equatable, Hashable {

  public init(data: AVBeamPackageData, files: [AVBeamFile]) {
    self.data = data
    self.files = files
  }

  public let data: AVBeamPackageData
  public let files: [AVBeamFile]

  public func hash(into hasher: inout Hasher) {
    for file in files {
      hasher.combine(file.description)
    }
  }
}
