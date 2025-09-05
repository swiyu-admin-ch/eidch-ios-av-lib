import Foundation

// MARK: - AVBeamCaptureFaceDelegate

/**
 * Delegate protocol for handling face capturing results.
 *
 * Implement this protocol to receive and handle the results of a face
 * capturing operation started with `startCaptureFace`.
 */
public protocol AVBeamCaptureFaceDelegate: AnyObject {
  /**
   * Called when the face capturing process has completed successfully.
   *
   * @param packageResult Contains the results of the face capturing process,
   *                      including captured face images and related data.
   */
  func didCompleteCaptureFace(packageResult: AVBeamPackageResult)
}
