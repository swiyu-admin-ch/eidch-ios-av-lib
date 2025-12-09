import Foundation

// MARK: - MotionManagerDelegate

protocol MotionManagerDelegate: AnyObject {
  func motionManager(_ manager: MotionManager, didCollectRecords records: [MotionRecord])
  func motionManager(_ manager: MotionManager, didFailWithError error: MotionManagerError)

  // Optional implementations

  func motionManager(_ manager: MotionManager, didReceiveRecord record: MotionRecord, totalRecords: Int)
  func motionManagerDidStartCollecting(_ manager: MotionManager)
  func motionManagerDidStopCollecting(_ manager: MotionManager)
}

extension MotionManagerDelegate {

  func motionManager(_ manager: MotionManager, didReceiveRecord record: MotionRecord, totalRecords: Int) {}
  func motionManagerDidStartCollecting(_ manager: MotionManager) {}
  func motionManagerDidStopCollecting(_ manager: MotionManager) {}
}
