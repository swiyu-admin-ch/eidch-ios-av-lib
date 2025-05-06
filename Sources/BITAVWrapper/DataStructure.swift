// MARK: - AVBeamInitConfig

public struct AVBeamInitConfig { /* to be defined */ }

// MARK: - AVBeamScanDocumentConfig

public struct AVBeamScanDocumentConfig { /* to be defined */ }

// MARK: - AVBeamRecordDocumentConfig

public struct AVBeamRecordDocumentConfig { /* to be defined */ }

// MARK: - AVBeamCaptureFaceConfig

public struct AVBeamCaptureFaceConfig { /* to be defined */ }

// MARK: - AVBeamScanNfcConfig

public struct AVBeamScanNfcConfig { /* to be defined */ }

// MARK: - AVBeamPackageResult

public struct AVBeamPackageResult { /* to be defined */ }

// MARK: - AVBeamError

public enum AVBeamError: Error { /* to be defined */ }

// MARK: - AVBeamNotification

public enum AVBeamNotification {
  case needSecondPage
  case comeCloserWhileScanning
  case stopMovingWhileScanning
  /* to be completed... */
}
