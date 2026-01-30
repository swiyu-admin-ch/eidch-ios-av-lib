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

  // Returns the textkey which must be mapped in the app translations
  public var textkey: String {
    "avbeam_notification_\(self)"
  }
}
