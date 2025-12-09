import Foundation

// MARK: - AVBeamFileType

public enum AVBeamFileType: Int, CaseIterable, Codable {
  case unknown = -1

  // Document formats
  case pdf = 10
  case pdfContract = 11

  // Data formats
  case xml = 20
  case json = 21

  // Image formats
  case bmp = 30
  case jpg = 31
  case png = 32

  // Video formats
  case mp4 = 40
  case gif = 41
  case m4v = 42
  case mov = 43
  case webm = 44

  // Certificate/Binary formats
  case der = 50
  case ef = 51
  case bin = 60

  // MARK: Lifecycle

  public init?(_ mimeType: String) {
    switch mimeType.lowercased() {
    case "application/pdf":
      self = .pdf
    case "application/xml":
      self = .xml
    case "application/json":
      self = .json
    case "image/bmp":
      self = .bmp
    case "image/jpeg":
      self = .jpg
    case "image/png":
      self = .png
    case "video/mp4":
      self = .mp4
    case "image/gif":
      self = .gif
    case "video/x-m4v":
      self = .m4v
    case "video/quicktime":
      self = .mov
    case "video/webm":
      self = .webm
    case "application/x-x509-ca-cert":
      self = .der
    case "application/octet-stream":
      self = .bin
    default:
      return nil
    }
  }

  public init?(_ value: Int) {
    self.init(rawValue: value)
  }

  // MARK: Public

  public var mimeType: String {
    switch self {
    case .unknown: ""
    case .pdf,
         .pdfContract:
      "application/pdf"
    case .xml:
      "application/xml"
    case .json:
      "application/json"
    case .bmp:
      "image/bmp"
    case .jpg:
      "image/jpeg"
    case .png:
      "image/png"
    case .mp4:
      "video/mp4"
    case .gif:
      "image/gif"
    case .m4v:
      "video/x-m4v"
    case .mov:
      "video/quicktime"
    case .webm:
      "video/webm"
    case .der:
      "application/x-x509-ca-cert"
    case .ef:
      "application/octet-stream"
    case .bin:
      "application/octet-stream"
    }
  }
}
