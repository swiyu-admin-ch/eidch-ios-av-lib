import Foundation

public struct AVBeamInitConfig {
  // MARK: Lifecycle

  public init(consoleLog: LogLevel = .debug, fileLog: LogLevel = .none, appId: String, errors: [AnyHashable: Any]? = [:], requiresSecurityCheck: Bool = false) {
    self.fileLog = fileLog
    self.consoleLog = consoleLog
    self.appId = appId
    self.errors = errors
    self.requiresSecurityCheck = requiresSecurityCheck
  }

  // MARK: Internal

  let fileLog: LogLevel
  let consoleLog: LogLevel
  let appId: String
  let errors: [AnyHashable: Any]?
  let requiresSecurityCheck: Bool
}
