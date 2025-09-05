import Foundation
import SwiftUI
import UIKit

// MARK: - AVBeam

public final class AVBeam: NSObject, AVBeamProtocol {

  public var state = AVBeamState.notInitialized

  public weak var messageDelegate: (any AVBeamMessageDelegate)?
  public weak var scanDocumentDelegate: (any AVBeamScanDocumentDelegate)?
  public weak var recordDocumentDelegate: (any AVBeamRecordDocumentDelegate)?
  public weak var captureFaceDelegate: (any AVBeamCaptureFaceDelegate)?
  public weak var nfcDelegate: (any AVBeamNfcDelegate)?

  public func initialize(using config: AVBeamInitConfig) throws {
    messageDelegate?.didReceiveNotification(notification: .initialized)
  }

  public func getGLView(width: Int, height: Int) -> UIView {
    UIView()
  }

  public func startCamera() throws {
    // No-op
  }

  public func stopCamera() throws {
    // No-op
  }

  public func startScanDocument(config: AVBeamScanDocumentConfig) throws {
    // No-op
  }

  public func stopScanDocument() {
    // No-op
  }

  public func startCaptureFace(config: AVBeamCaptureFaceConfig) throws {
    // No-op
  }

  public func stopCaptureFace() {
    // No-op
  }

  public func startNfcScan(config: AVBeamScanNfcConfig) throws {
    // No-op
  }

  public func stopNfcScan() {
    // No-op
  }

  public func startRecordDocument(config: AVBeamRecordDocumentConfig) throws {
    // No-op
  }

  public func stopRecordDocument() {
    // No-op
  }

  public func shutdown() {
    // No-op
  }
}
