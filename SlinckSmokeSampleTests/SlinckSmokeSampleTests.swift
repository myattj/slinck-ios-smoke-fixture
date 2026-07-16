import XCTest
@testable import SlinckSmokeSample

final class SlinckSmokeSampleTests: XCTestCase {
    func testSmokeStatusAccessibilitySummaryIsStable() {
        let status = SmokeStatus.sample

        XCTAssertEqual(status.title, "Slinck Smoke Sample")
        XCTAssertEqual(status.buildLabel, "Build ready")
        XCTAssertEqual(status.artifactLabel, "Artifacts ready")
        XCTAssertEqual(status.accessibilitySummary, "Slinck Smoke Sample Build ready Artifacts ready")
    }
}
