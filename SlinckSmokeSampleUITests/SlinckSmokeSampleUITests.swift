import XCTest

final class SlinckSmokeSampleUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    /// Asserts the identifiers a remote agent drives this app by. The demo
    /// taps `smoke.confirm` and reads `smoke.subtitle` back to prove it drove
    /// the app rather than only photographing it, so those two identifiers
    /// disappearing is the failure this test exists to catch.
    func testLaunchScreenExposesSmokeIdentifiers() throws {
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.staticTexts["smoke.title"].waitForExistence(timeout: 10))
        XCTAssertTrue(app.staticTexts["smoke.subtitle"].exists)
        XCTAssertTrue(app.buttons["smoke.confirm"].exists)
    }

    func testConfirmButtonUpdatesTheSubtitle() throws {
        let app = XCUIApplication()
        app.launch()

        let subtitle = app.staticTexts["smoke.subtitle"]
        XCTAssertTrue(subtitle.waitForExistence(timeout: 10))
        XCTAssertEqual(subtitle.label, "Remote build verified")

        app.buttons["smoke.confirm"].tap()

        XCTAssertTrue(
            app.staticTexts["smoke.subtitle"].waitForExistence(timeout: 5)
        )
        XCTAssertEqual(app.staticTexts["smoke.subtitle"].label, "Confirmed by agent")
    }
}
