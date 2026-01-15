public enum AVBeamPackageErrorType: Int, Codable {
  case none = 0, retrySave, retry

  public init?(_ error: Int) {
    self.init(rawValue: error)
  }
}
