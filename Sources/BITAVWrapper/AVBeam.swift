import Foundation
import SwiftUI
import UIKit

// Entry point class for AVBeam

// MARK: - AVBeam

public final class AVBeam: NSObject, AVBeamProtocol, @unchecked Sendable {

  // MARK: Public

  public var state = AVBeamState.notInitialized

  public weak var messageDelegate: (any AVBeamMessageDelegate)?
  public weak var scanDocumentDelegate: (any AVBeamScanDocumentDelegate)?
  public weak var recordDocumentDelegate: (any AVBeamRecordDocumentDelegate)?
  public weak var captureFaceDelegate: (any AVBeamCaptureFaceDelegate)?
  public weak var nfcDelegate: (any AVBeamNfcDelegate)?

  public func initialize(using config: AVBeamInitConfig) throws  {
    messageDelegate?.didReceiveNotification(notification: .initialized)
  }

  public func getGLView(width: Int, height: Int) -> UIView  {
    UIView()
  }

  public func startCamera() throws  {
    // no-op
  }

  public func startFrontCamera() throws  {
    // no-op
  }

  public func stopCamera() throws  {
    // no-op
  }

  public func startScanDocument(config: AVBeamScanDocumentConfig) throws  {
    // no-op
  }

  public func stopScanDocument()  {
    // no-op
  }

  public func startCaptureFace(config: AVBeamCaptureFaceConfig) throws  {
    // no-op
  }

  public func stopCaptureFace()  {
    // no-op
  }

  public func startNfcScan(config: AVBeamScanNfcConfig) throws  {
    // no-op
  }

  public func stopNfcScan()  {
    // no-op
  }

  public func startRecordDocument(config: AVBeamRecordDocumentConfig) throws  {
    // no-op
  }

  public func stopRecordDocument()  {
    // no-op
  }

  public func shutdown()  {
    // no-op
  }
  
}

// MARK: MotionManagerDelegate

extension AVBeam: MotionManagerDelegate {
  func motionManager(_ manager: MotionManager, didFailWithError error: MotionManagerError) {}
  func motionManager(_ manager: MotionManager, didCollectRecords records: [MotionRecord]) {}
}
