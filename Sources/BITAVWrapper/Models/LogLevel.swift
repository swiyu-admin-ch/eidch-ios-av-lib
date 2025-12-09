/// Map enum based on ELogLevel enum present in PXLSDK
public enum LogLevel: Int {
  case none = 0
  case errors = 1
  case warnings = 2 // 1 << 1
  case information = 4 // 1 << 2
  case debug = 8 // 1 << 3
  case verbose = 16 // 1 << 4
}
