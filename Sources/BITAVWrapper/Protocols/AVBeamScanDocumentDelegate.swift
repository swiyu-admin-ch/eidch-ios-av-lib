import Foundation

// MARK: - AVBeamScanDocumentDelegate

/**
 * Delegate protocol for handling document scanning results.
 *
 * Implement this protocol to receive and handle the results of a document
 * scanning operation started with `startScanDocument`.
 */
public protocol AVBeamScanDocumentDelegate: AnyObject {
  /**
   * Called when the document scanning process has completed successfully.
   *
   * @param packageResult Contains the results of the document scanning process,
   *                      including captured images and extracted data.
   */
  func didCompleteScanDocument(packageResult: AVBeamPackageResult)
}
