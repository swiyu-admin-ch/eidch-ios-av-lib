import SwiftUI
import UIKit

// MARK: - AVBeam

/**
 * Protocol that defines the interface for the AVBeam library, which provides
 * functionality for document scanning, recording, face capture, and NFC scanning.
 *
 * AVBeam follows a delegate pattern to handle results and notifications
 * asynchronously, with separate delegates for each major functionality area.
 */
public protocol AVBeamProtocol: AnyObject, Sendable {
  /**
   * Default initializer for creating an AVBeam instance.
   *
   * This creates an uninitialized instance that must be configured with the
   * `initialize(using:)` method before use.
   */
  init()

  /**
   * Current state of the AVBeam instance.
   *
   * This property provides access to the current operational state of the AVBeam
   * instance, which can be used to determine if the library is properly initialized,
   * if scanning operations are in progress, or if there are any error conditions.
   */
  var state: AVBeamState { get }

  /**
   * Initializes the AVBeam instance with the provided configuration.
   *
   * @param config Configuration settings required to initialize the AVBeam instance.
   * @throws AVBeamError if initialization fails due to invalid configuration or system limitations.
   */
  func initialize(using config: AVBeamInitConfig) throws

  /**
   * Shuts down the AVBeam instance and releases all associated resources.
   *
   * This method should be called when the AVBeam instance is no longer needed
   * to ensure proper cleanup of system resources, including camera access,
   * OpenGL contexts, and any ongoing scanning operations.
   *
   * After calling this method, the instance should not be used until it is
   * reinitialized with `initialize(using:)`.
   */
  func shutdown()

  /**
   * Creates and returns a UIView containing an OpenGL rendering context for camera preview.
   *
   * This method creates a specialized view that can display the camera feed and
   * overlay scanning indicators, bounding boxes, and other visual feedback during
   * scanning operations.
   *
   * @param width The desired width of the OpenGL view in points.
   * @param height The desired height of the OpenGL view in points.
   * @return A UIView configured with OpenGL rendering capabilities for camera display.
   *
   * @note The returned view should be added to your view hierarchy before starting
   *       any camera-based operations to ensure proper rendering.
   */
  func getGLView(width: Int, height: Int) -> UIView

  /**
   * Activates the device camera for scanning operations.
   *
   * Must be called before starting any scanning or capture operations.
   *
   * @throws AVBeamError if camera access is denied or the camera is unavailable.
   */
  func startCamera() throws

  /**
   * Activates the device front camera for scanning operations.
   *
   * Must be called before starting any scanning or capture operations.
   *
   * @throws AVBeamError if camera access is denied or the camera is unavailable.
   */
  func startFrontCamera() throws

  /**
   * Deactivates the device camera.
   *
   * Should be called when scanning operations are complete to release camera resources.
   *
   * @throws AVBeamError if there's an issue while stopping the camera.
   */
  func stopCamera() throws

  /**
   * Starts the document scanning process with the specified configuration.
   *
   * This begins a document scanning session that will capture and process document images.
   * Results are delivered asynchronously through the `scanDocumentDelegate`.
   *
   * @param config Configuration settings for the document scanning process.
   * @throws AVBeamError if scanning cannot be started or the camera is not active.
   *
   * @note This method returns immediately. All processing and results are delivered
   *       asynchronously through the delegate pattern on a background thread, with
   *       delegate callbacks dispatched to the main thread for UI updates.
   */
  func startScanDocument(config: AVBeamScanDocumentConfig) throws

  /**
   * Stops an ongoing document scanning session.
   *
   * This should be called when the scanning process is complete or needs to be
   * canceled before completion.
   *
   * @note This method returns immediately. Final results, if any, will be delivered
   *       through the `scanDocumentDelegate`.
   */
  func stopScanDocument()

  /**
   * Starts the face capturing process with the specified configuration.
   *
   * This begins a face detection and capture session.
   * Results are delivered asynchronously through the `captureFaceDelegate`.
   *
   * @param config Configuration settings for the face capturing process.
   * @throws AVBeamError if face capture cannot be started or the camera is not active.
   *
   * @note This method returns immediately. All processing and results are delivered
   *       asynchronously through the delegate pattern on a background thread, with
   *       delegate callbacks dispatched to the main thread for UI updates.
   */
  func startCaptureFace(config: AVBeamCaptureFaceConfig) throws

  /**
   * Stops an ongoing face capturing session.
   *
   * This should be called when the face capturing process is complete or needs to be
   * canceled before completion.
   *
   * @note This method returns immediately. Final results, if any, will be delivered
   *       through the `captureFaceDelegate`.
   */
  func stopCaptureFace()

  /**
   * Starts an NFC scanning session with the specified configuration.
   *
   * This begins an NFC scanning process to read data from NFC-enabled documents or cards.
   * Results are delivered asynchronously through the `nfcDelegate`.
   *
   * @param config Configuration settings for the NFC scanning process.
   * @throws AVBeamError if NFC scanning cannot be started or NFC is not available on the device.
   */
  func startNfcScan(config: AVBeamScanNfcConfig) throws

  /**
   * Stops an ongoing NFC scanning session.
   *
   * This should be called when the NFC scanning process is complete or needs to be
   * canceled before completion.
   */
  func stopNfcScan()

  /**
   * Starts the document recording process with the specified configuration.
   *
   * This begins a document recording session that captures video or sequential images
   * of documents for processing or verification purposes. The recording process
   * differs from scanning in that it captures continuous media rather than static images.
   * Results are delivered asynchronously through the `recordDocumentDelegate`.
   *
   * @param config Configuration settings for the document recording process, including
   *               recording duration, quality settings, and output format preferences.
   * @throws AVBeamError if recording cannot be started, the camera is not active,
   *                     or insufficient storage space is available.
   *
   * @note This method returns immediately. All processing and results are delivered
   *       asynchronously through the delegate pattern on a background thread, with
   *       delegate callbacks dispatched to the main thread for UI updates.
   */
  func startRecordDocument(config: AVBeamRecordDocumentConfig) throws

  /**
   * Stops an ongoing document recording session.
   *
   * This should be called when the recording process is complete or needs to be
   * canceled before completion. Any partial recording data may be preserved
   * depending on the implementation and configuration settings.
   *
   * @note This method returns immediately. Final results will be delivered
   *       through the `recordDocumentDelegate` if one is set.
   */
  func stopRecordDocument()

  /**
   * Delegate for handling errors and notifications that are not specific to any
   * particular functionality.
   *
   * Set this delegate to receive general error messages and system notifications.
   */
  var messageDelegate: AVBeamMessageDelegate? { get set }

  /**
   * Delegate for handling document scanning results.
   *
   * Set this delegate before calling `startScanDocument` to receive the results
   * when the scanning process completes or provides incremental updates.
   */
  var scanDocumentDelegate: AVBeamScanDocumentDelegate? { get set }

  /**
   * Delegate for handling document recording results.
   *
   * Set this delegate before calling `startRecordDocument` to receive the results
   * when the recording process completes or provides incremental updates.
   */
  var recordDocumentDelegate: AVBeamRecordDocumentDelegate? { get set }

  /**
   * Delegate for handling face capturing results.
   *
   * Set this delegate before calling `startCaptureFace` to receive the results
   * when the face capturing process completes or provides detection updates.
   */
  var captureFaceDelegate: AVBeamCaptureFaceDelegate? { get set }

  /**
   * Delegate for handling NFC scanning results.
   *
   * Set this delegate before calling `startNfcScan` to receive the results
   * when the NFC scanning process completes or provides incremental updates.
   */
  var nfcDelegate: AVBeamNfcDelegate? { get set }
}
