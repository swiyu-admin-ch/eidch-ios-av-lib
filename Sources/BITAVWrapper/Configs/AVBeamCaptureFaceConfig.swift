import Foundation

public struct AVBeamCaptureFaceConfig {

  public let files: [AVBeamFile]
  public let duration: TimeInterval

  public init(files: [AVBeamFile] = [], duration: TimeInterval = 10) {
    self.files = files
    self.duration = duration
  }
}
