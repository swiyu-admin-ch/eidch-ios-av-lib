import Foundation

public struct AVBeamFile {
  public let type: AVBeamFileType
  public let description: String
  public let data: Data

  public init(type: AVBeamFileType, description: String, data: Data) {
    self.type = type
    self.description = description
    self.data = data
  }
}
