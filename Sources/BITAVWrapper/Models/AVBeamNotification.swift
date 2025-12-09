import Foundation

// MARK: - AVBeamNotification

public enum AVBeamNotification: Int, Codable {
  // General status
  case initialized = 0
  case messageClear = 1

  // QR Code recognition (100-105)
  case qrCodeRecognitionStarted = 100
  case qrCodeExtractionDone = 101
  case qrCodeMoveFurther = 102
  case qrCodeMoveCloser = 103
  case qrCodeRecognitionStopped = 104
  case qrCodeCaptured = 105

  // ID recognition (200-225)
  case idRecognitionStarted = 200
  case idRecognitionStopped = 201
  case idFinalDataSet = 204
  case idRotateLess = 205
  case idMoveCloser = 206
  case idMoveFurther = 207
  case idDetectionDone = 208
  case idMrzFound = 209
  case idMrzNotFound = 210
  case idDocMatched = 211
  case idDocNotMatched = 212
  case idNeedSecondPageForMrz = 213
  case idNeedSecondPageForMatching = 214
  case idNeedSamePageForMatching = 215
  case waitingForViz = 216
  case idDataForUploadSet = 217
  case idNeedSamePageForMrz = 218
  case idBadPosition = 219
  case idHoldStill = 220
  case idRotate90 = 221
  case idRotateScreen = 222
  case idRotateScreenAndDoc = 223
  case idReflectionDetected = 224
  case idNotDetected = 225

  // Document capturing (300-302)
  case docCapturingStarted = 300
  case docCapturingStopped = 301
  case docCaptured = 302

  // Signature (400-404)
  case signatureStarted = 400
  case signatureAccepted = 401
  case signatureCleared = 402
  case signatureStopped = 403
  case signatureDrawingStarted = 404

  // Face capturing (500-510)
  case faceCapturingStarted = 500
  case faceCapturingStopped = 501
  case faceCaptured = 502
  case faceCaptureMoveRight = 503
  case faceCaptureMoveLeft = 504
  case faceCaptureTiltRight = 505
  case faceCaptureTiltLeft = 506
  case faceCaptureBlink = 507
  case faceCaptureTiltWait = 508
  case faceCaptureTiltSmile = 509
  case faceCaptureLivenessFailed = 510

  // Face verification (600-603)
  case faceVerificationStarted = 600
  case faceVerificationStopped = 601
  case faceVerified = 602
  case faceVerificationFailed = 603

  // Data encryption (700-702)
  case dataEncryptionStarted = 700
  case dataEncryptionStopped = 701
  case dataEncrypted = 702

  // Data decryption (800-802)
  case dataDecryptionStarted = 800
  case dataDecryptionStopped = 801
  case dataDecrypted = 802

  // Security features (900-905)
  case idNeedSecurityFeatures = 900
  case securityFeaturesStarted = 901
  case securityFeaturesStopped = 902
  case securityFeaturesReady = 903
  case securityFeaturesTracking = 904
  case securityFeaturesTrackingLost = 905

  // Streaming (1000)
  case streamingStarted = 1000

  // NFC (1100-1123)
  case nfcAuthenticationPassDeprecated = 1100
  case nfcDataReadingStart = 1101
  case nfcDataReadingEndSuccess = 1102
  case nfcDataReadingEndFail = 1103
  case nfcPhotoReadingStartDeprecated = 1104
  case nfcPhotoReadingFinishDeprecated = 1105
  case nfcReadingStopped = 1106
  case nfcUnavailable = 1107
  case nfcReadAtrInfo = 1108
  case nfcAccessControl = 1109
  case nfcReadSod = 1110
  case nfcReadDg14 = 1111
  case nfcChipAuthentication = 1112
  case nfcReadDg15 = 1113
  case nfcActiveAuthentication = 1114
  case nfcReadDg1 = 1115
  case nfcReadDg2 = 1116
  case nfcReadDg7 = 1117
  case nfcReadDg11 = 1118
  case nfcReadDg12 = 1119
  case nfcPassiveAuthentication = 1120
  case nfcChipClonedDetectionStart = 1121
  case nfcChipClonedDetectionEndSuccess = 1122
  case nfcConnectingToServer = 1123

  // Document recording (1200-1202)
  case docRecordingStarted = 1200
  case docRecordingStopped = 1201
  case docRecorded = 1202

  // Device integrity (1300-1301)
  case deviceIntegrityCheckSuccess = 1300
  case deviceIntegrityCheckFailed = 1301

  // MARK: Lifecycle

  public init?(_ status: Int) {
    self.init(rawValue: status)
  }
}

// MARK: LocalizedError

extension AVBeamNotification: LocalizedError {
  public var recoverySuggestion: String? {
    switch self {
    // General status
    case .initialized:
      nil
    case .messageClear:
      nil

    // QR Code recognition (100-105)
    case .qrCodeRecognitionStarted:
      "Point your camera at the QR code"
    case .qrCodeExtractionDone:
      nil
    case .qrCodeMoveFurther:
      "Move your device further away from the QR code"
    case .qrCodeMoveCloser:
      "Move your device closer to the QR code"
    case .qrCodeRecognitionStopped:
      nil
    case .qrCodeCaptured:
      nil

    // ID recognition (200-225)
    case .idRecognitionStarted:
      "Position your document within the frame"
    case .idRecognitionStopped:
      nil
    case .idFinalDataSet:
      nil
    case .idRotateLess:
      "Rotate the document slightly to align properly"
    case .idMoveCloser:
      "Move your device closer to the document"
    case .idMoveFurther:
      "Move your device further from the document"
    case .idDetectionDone:
      nil
    case .idMrzFound:
      nil
    case .idMrzNotFound:
      "Make sure the MRZ area is visible and clear"
    case .idDocMatched:
      nil
    case .idDocNotMatched:
      "Ensure both sides of the document match"
    case .idNeedSecondPageForMrz:
      "Turn the document to scan the back side"
    case .idNeedSecondPageForMatching:
      "Turn the document to the other side"
    case .idNeedSamePageForMatching:
      "Keep the document on the same side"
    case .waitingForViz:
      "Please wait while processing the visual zone"
    case .idDataForUploadSet:
      nil
    case .idNeedSamePageForMrz:
      "Keep the document on the same side to read MRZ"
    case .idBadPosition:
      "Position the document properly within the frame"
    case .idHoldStill:
      "Hold still"
    case .idRotate90:
      "Rotate the document 90 degrees"
    case .idRotateScreen:
      "Rotate your device to match the document orientation"
    case .idRotateScreenAndDoc:
      "Rotate both your device and the document"
    case .idReflectionDetected:
      "Avoid reflections by adjusting lighting or angle"
    case .idNotDetected:
      "Make sure the document is clearly visible and well-lit"

    // Document capturing (300-302)
    case .docCapturingStarted:
      "Position your document within the frame"
    case .docCapturingStopped:
      nil
    case .docCaptured:
      nil

    // Signature (400-404)
    case .signatureStarted:
      "Sign within the designated area"
    case .signatureAccepted:
      nil
    case .signatureCleared:
      "Please sign again"
    case .signatureStopped:
      nil
    case .signatureDrawingStarted:
      "Continue signing within the area"

    // Face capturing (500-510)
    case .faceCapturingStarted:
      "Position your face within the oval frame"
    case .faceCapturingStopped:
      nil
    case .faceCaptured:
      nil
    case .faceCaptureMoveRight:
      "Move your head slightly to the right"
    case .faceCaptureMoveLeft:
      "Move your head slightly to the left"
    case .faceCaptureTiltRight:
      "Tilt your head slightly to the right"
    case .faceCaptureTiltLeft:
      "Tilt your head slightly to the left"
    case .faceCaptureBlink:
      "Please blink naturally"
    case .faceCaptureTiltWait:
      "Hold your head position and wait"
    case .faceCaptureTiltSmile:
      "Please smile naturally"
    case .faceCaptureLivenessFailed:
      "Liveness check failed. Please try again with natural movements"

    // Face verification (600-603)
    case .faceVerificationStarted:
      "Look directly at the camera for verification"
    case .faceVerificationStopped:
      nil
    case .faceVerified:
      nil
    case .faceVerificationFailed:
      "Face verification failed. Please try again with better lighting"

    // Data encryption (700-702)
    case .dataEncryptionStarted:
      "Please wait while data is being encrypted"
    case .dataEncryptionStopped:
      nil
    case .dataEncrypted:
      nil

    // Data decryption (800-802)
    case .dataDecryptionStarted:
      "Please wait while data is being decrypted"
    case .dataDecryptionStopped:
      nil
    case .dataDecrypted:
      nil

    // Security features (900-905)
    case .idNeedSecurityFeatures:
      "Additional security verification required"
    case .securityFeaturesStarted:
      "Security check in progress"
    case .securityFeaturesStopped:
      nil
    case .securityFeaturesReady:
      nil
    case .securityFeaturesTracking:
      "Keep the document steady during security verification"
    case .securityFeaturesTrackingLost:
      "Security tracking lost. Please reposition the document"

    // Streaming (1000)
    case .streamingStarted:
      nil

    // NFC (1100-1123)
    case .nfcAuthenticationPassDeprecated:
      nil
    case .nfcDataReadingStart:
      "Hold your device near the document's NFC chip"
    case .nfcDataReadingEndSuccess:
      nil
    case .nfcDataReadingEndFail:
      "NFC reading failed. Try positioning your device differently"
    case .nfcPhotoReadingStartDeprecated:
      nil
    case .nfcPhotoReadingFinishDeprecated:
      nil
    case .nfcReadingStopped:
      nil
    case .nfcUnavailable:
      "NFC is not available on this device"
    case .nfcReadAtrInfo:
      "Reading NFC chip information"
    case .nfcAccessControl:
      "Accessing NFC security controls"
    case .nfcReadSod:
      "Reading security object data"
    case .nfcReadDg14:
      "Reading security features"
    case .nfcChipAuthentication:
      "Authenticating NFC chip"
    case .nfcReadDg15:
      "Reading active authentication data"
    case .nfcActiveAuthentication:
      "Performing active authentication"
    case .nfcReadDg1:
      "Reading document data group 1"
    case .nfcReadDg2:
      "Reading biometric data"
    case .nfcReadDg7:
      "Reading signature data"
    case .nfcReadDg11:
      "Reading additional personal data"
    case .nfcReadDg12:
      "Reading additional document data"
    case .nfcPassiveAuthentication:
      "Performing passive authentication"
    case .nfcChipClonedDetectionStart:
      "Checking for chip authenticity"
    case .nfcChipClonedDetectionEndSuccess:
      nil
    case .nfcConnectingToServer:
      "Connecting to verification server"

    // Document recording (1200-1202)
    case .docRecordingStarted:
      "Document recording started"
    case .docRecordingStopped:
      nil
    case .docRecorded:
      nil

    // Device integrity (1300-1301)
    case .deviceIntegrityCheckSuccess:
      nil
    case .deviceIntegrityCheckFailed:
      "Device integrity check failed. Please use a secure device"

    // Default case for any future additions
    default:
      "Place document within overlay"
    }
  }
}
