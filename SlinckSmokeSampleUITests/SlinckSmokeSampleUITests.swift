import XCTest

final class SlinckSmokeSampleUITests: XCTestCase {
    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testQualificationSurfaceExposesEveryDrivableIdentifier() throws {
        let app = XCUIApplication()
        app.launch()

        XCTAssertTrue(app.staticTexts["smoke.title"].waitForExistence(timeout: 10))
        XCTAssertTrue(app.staticTexts["smoke.subtitle"].exists)
        XCTAssertTrue(app.buttons["smoke.confirm"].exists)
        XCTAssertTrue(app.staticTexts["smoke.status.build"].exists)
        XCTAssertTrue(app.staticTexts["smoke.status.artifacts"].exists)
        XCTAssertTrue(app.buttons["smoke.ready.button"].exists)
        XCTAssertTrue(app.textFields["qualification.input"].exists)
        XCTAssertTrue(app.scrollViews["qualification.scroll"].exists)
    }

    func testTypingIntoTheNoteFieldEchoesIt() throws {
        let app = XCUIApplication()
        app.launch()

        let field = app.textFields["qualification.input"]
        XCTAssertTrue(field.waitForExistence(timeout: 10))
        field.tap()
        field.typeText("slinck")

        XCTAssertEqual(app.staticTexts["qualification.note.echo"].label, "slinck")
    }
}
