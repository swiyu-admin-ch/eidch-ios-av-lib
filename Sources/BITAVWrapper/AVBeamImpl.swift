import Foundation

public class AVBeamImpl: AVBeam {

  // MARK: Lifecycle

  public required init(config: AVBeamInitConfig) throws {
    // No-op
  }

  // MARK: Public

  public var messageDelegate: AVBeamMessageDelegate?
  public var scanDocumentDelegate: AVBeamScanDocumentDelegate?
  public var recordDocumentDelegate: AVBeamRecordDocumentDelegate?
  public var captureFaceDelegate: AVBeamCaptureFaceDelegate?
  public var scanNfcDelegate: AVBeamScanNfcDelegate?

  public func startScanDocument(config: AVBeamScanDocumentConfig) {
    // No-op
  }

  public func stopScanDocument() {
    // No-op
  }

  public func startRecordDocument(confgi: AVBeamRecordDocumentConfig) {
    // No-op
  }

  public func stopRecordDocument() {
    // No-op
  }

  public func startCaptureFace(config: AVBeamCaptureFaceConfig) {
    // No-op
  }

  public func stopCaptureFace() {
    // No-op
  }

}
