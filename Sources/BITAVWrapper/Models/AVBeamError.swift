import Foundation

public enum AVBeamError: Int, Error, Codable {
  // Special cases
  case noImages = 999
  case none = 0

  // General errors (1-12)
  case unknown = 1
  case unexpectedStop = 2
  case thirdPartyLibFailure = 3
  case thirdPartyLibLicenseExpired = 4
  case cameraFailure = 5
  case cameraAccessForbidden = 6
  case noInternetConnection = 7
  case functionNotIncluded = 8
  case unsupportedCameraResolution = 9
  case unsupportedVideoConfiguration = 10
  case incorrectInput = 11
  case moduleNotInitialized = 12

  // QR Code errors (100-103)
  case qrCodeGeneric = 100
  case qrCodeTimeoutExpired = 101
  case qrCodeCaptureFailed = 102
  case qrCodeBadData = 103

  // ID errors (200-240)
  case idGeneric = 200
  case idTimeoutExpired = 201
  case idNoData = 203
  case idNotInList = 204
  case idExpired = 205
  case idFaceImageCaptureFailed = 207
  case idTypeNotValid = 208
  case idSecondPageMissingDeprecated = 209
  case idFinalPackageDataForUpload = 210
  case idMatchingFailed = 211
  case idBadMrzFields = 212
  case idBadMrzFieldBirthDay = 213
  case idBadMrzFieldCompositCheckDigit = 214
  case idBadMrzFieldExpiryDay = 215
  case idBadMrzFieldDocumentNumber = 216
  case idBadMrzFieldGender = 217
  case idBadMrzFieldFirstName = 218
  case idBadMrzFieldLastName = 219
  case idBadMrzFieldCountry = 220
  case idBadMrzFieldNationality = 221
  case idIncompleteData = 222
  case documentUpsidedown = 223
  case idMatchingFailedMrz = 224
  case signatureCaptureFailed = 225
  case idPageMissing = 226
  case idNeedSecondPageForMrz = 227
  case idNeedSecondPageForMatching = 228
  case idMismatch = 229
  case idNotDetected = 230
  case optionalPageMissing = 231
  case optionalPageNotDetected = 232
  case mrzNotDetected = 240

  // Image errors (301-356)
  case imageDocumentTooRotated = 301
  case imageDocumentTooFar = 302
  case imageDocumentTooClose = 303
  case imageBlurred = 304
  case imageUnsupportedType = 305
  case imageUnsupportedResolution = 306
  case reflection = 308
  case imageFromScreen = 350
  case imageIsGreyscale = 351
  case imageInjection = 352
  case mrzLayoutValidation = 353
  case specimenDetection = 354
  case faceLayoutValidation = 355
  case imageAnomaly = 356
  case documentLivenessFailure = 357

  // PDF/Document errors (400-451)
  case signDocGeneric = 400
  case pdfDocNotValid = 401
  case pdfDocNeedInputPassword = 402
  case pdfDocUnknownEncryption = 403
  case pdfDocDamagedOrInvalidFormat = 404
  case pdfDocAccessDeniedOrInvalidFilePath = 405
  case pdfDocNotFound = 406
  case pdfDocUnknown = 407
  case docGeneric = 450
  case docTimeoutExpired = 451

  // Face errors (500-508)
  case faceCaptureGeneric = 500
  case faceCaptureIncomplete = 502
  case faceNotRecognized = 503
  case faceNotVerified = 504
  case faceStatic = 505
  case faceLivenessFailed = 506
  case faceCaptureIntegrityCheckFailed = 507
  case faceFrameSimilarityFailed = 508

  // Data encryption & function errors (600-666)
  case dataEncryptionGeneric = 600
  case functionNotImplemented = 666

  // Data decryption errors (700-701)
  case dataDecryptionGeneric = 700
  case dataDecryptionFaceNoMatch = 701

  // Security features errors (800-804)
  case securityFeaturesGeneric = 800
  case hologramDetectionFailed = 801
  case lenticularDetectionFailed = 802
  case manipulatedDocument = 803
  case trackingTimeout = 804

  // NFC errors (900-1016)
  case nfcTagWasLost = 900
  case nfcNotConnected = 901
  case nfcMutualAuthenticationFailedUnknownDeprecated = 902
  case nfcMutualAuthenticationFailedNotSatisfied = 903
  case nfcReadFailed = 904
  case nfcUnexpectedException = 905
  case nfcTimeout = 906
  case nfcNotSupported = 907
  case nfcCertificateValidationFailed = 908
  case nfcTechnicalError = 909
  case nfcClonedChip = 910
  case nfcTemperedDataDeprecated = 911
  case nfcSodVsComInsonsitencyDeprecated = 912
  case nfcInvalidHashesDeprecated = 913
  case nfcSessionInvalidated = 1000
  case nfcUserInvalidatedSessionDeprecated = 1001
  case nfcMoreThanOneTagFound = 1002
  case nfcWrongTag = 1003
  case nfcPaceOrBacFailedDeprecated = 1004
  case nfcLibConnectionLostDeprecated = 1005
  case nfcLibConnectingFailedDeprecated = 1006
  case nfcBackendFailedToParseSod = 1007
  case nfcBackendDataGroupsHashesWithUnsupportedAlgorithm = 1008
  case nfcBackendSignatureVerifyException = 1009
  case nfcBackendFailedToParseDg1 = 1010
  case nfcBackendFailedToParseDg2 = 1011
  case nfcBackendFailedToParseDg7 = 1012
  case nfcBackendFailedToParseDg11 = 1013
  case nfcBackendFailedToParseDg12 = 1014
  case nfcBackendFailedToEncodeFacePhotoAsJpeg = 1015
  case nfcBackendFailedToEncodeSignaturePhotoAsJpeg = 1016

  // Document recording and device integrity errors (1100-1200)
  case docRecordingGeneric = 1100
  case deviceIntegrityCompromised = 1200

  // Custom errors
  case startScanDocument = 9000
  case startCaptureFace = 9010
  case startNfcScan = 9020
  case startDocumentRecording = 9030
  case startCamera = 9100
  case startFrontCamera = 9101
  case stopCamera = 9110
  case wrapperNotSet = 9200

  // MARK: Lifecycle

  public init?(_ error: Int) {
    self.init(rawValue: error)
  }

  public var textkey: String {
    return "avbeam_error_\(self)"
  }
}

// MARK: - LocalizedError

extension AVBeamError: LocalizedError {

  // Returns the textkey which must be mapped in the app translations
  public var errorDescription: String? {
    textkey
  }
}
