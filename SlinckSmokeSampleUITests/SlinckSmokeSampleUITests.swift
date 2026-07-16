import XCTest

final class SlinckSmokeSampleUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunchScreenExposesSmokeIdentifiers() throws {
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.staticTexts["smoke.title"].waitForExistence(timeout: 5))
        XCTAssertTrue(app.staticTexts["smoke.subtitle"].exists)
        XCTAssertTrue(app.staticTexts["smoke.status.build"].exists)
        XCTAssertTrue(app.staticTexts["smoke.status.artifacts"].exists)
        XCTAssertTrue(app.buttons["smoke.ready.button"].exists)
        XCTAssertTrue(app.textFields["qualification.input"].exists)
        XCTAssertTrue(app.scrollViews["qualification.scroll"].exists)
    }
}
