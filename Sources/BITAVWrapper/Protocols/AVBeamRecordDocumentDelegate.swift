import Foundation

// MARK: - AVBeamRecordDocumentDelegate

/**
 * Delegate protocol for handling document recording results.
 *
 * Implement this protocol to receive and handle the results of a document
 * recording operation started with `startRecordDocument`.
 */
public protocol AVBeamRecordDocumentDelegate: AnyObject {
  /**
   * Called when the document recording process has completed successfully.
   *
   * @param packageResult Contains the results of the document recording process,
   *                      including the recorded video or sequence of images.
   */
  func didCompleteRecordDocument(packageResult: AVBeamPackageResult)
}
