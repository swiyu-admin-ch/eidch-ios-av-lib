import XCTest
@testable import BITAVWrapper

final class BITAVWrapperTests: XCTestCase {
  func testInitAVBeam() throws {
    let avBeam = try AVBeamImpl(config: AVBeamInitConfig())
    XCTAssertNotNil(avBeam)
  }
}
