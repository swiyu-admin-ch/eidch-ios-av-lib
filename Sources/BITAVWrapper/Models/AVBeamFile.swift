import Foundation

// MARK: - AVBeamFile

public struct AVBeamFile: Codable, Equatable {
  public let type: AVBeamFileType
  public let description: String
  public let data: Data

  public init(type: AVBeamFileType, description: String, data: Data) {
    self.type = type
    self.description = description
    self.data = data
  }
}

// MARK: Hashable

extension AVBeamFile: Hashable {
  public func hash(into hasher: inout Hasher) {
    hasher.combine(type)
    hasher.combine(data)
    hasher.combine(description)
  }
}
