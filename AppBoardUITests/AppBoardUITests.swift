//
//  AppBoardUITests.swift
//  AppBoardUITests
//
//  Created by Tatsuya Tobioka on 3/17/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import XCTest

class AppBoardUITests: XCTestCase {

    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testCreateAndDeleteBoard() {
        let app = XCUIApplication()
        let count = app.cells.count + 1
        let boardName = self.boardName
        
        let cell = createBoard(app, name: boardName)
        
        XCTAssertEqual(app.cells.count, count)
        XCTAssert(cell.exists)
        
        cell.swipeLeft()
        app.cells.buttons["Delete"].tap()
        
        XCTAssertEqual(app.cells.count, count - 1)
    }
    
    func testAddApp() {
        let app = XCUIApplication()
        let boardName = self.boardName
        
        let cell = createBoard(app, name: boardName)
        
        cell.tap()
        
        createApp(app)

        app.cells.staticTexts[appName].tap()
        XCTAssert(app.navigationBars.staticTexts[appName].exists)
    }
    
    private func createBoard(app: XCUIApplication, name: String) -> XCUIElement {
        app.navigationBars.buttons["Add"].tap()
        
        let alert = app.alerts["Add New Board"]
        alert.textFields.elementBoundByIndex(0).typeText(name)
        alert.buttons["Add"].tap()
        
        return app.cells.staticTexts[name]
    }
    
    private func createApp(app: XCUIApplication) {
        app.navigationBars.buttons["Add"].tap()
        
        app.typeText(appName)
        app.buttons["Search"].tap()

        app.cells.staticTexts[appName].tap()

        let alert = app.alerts["Add to Board"]
        alert.buttons["Add"].tap()
    }
    
    private var boardName: String {
        return "Board Name \(NSDate().description)"
    }
    
    private let appName = "TimeCrowd"
}
