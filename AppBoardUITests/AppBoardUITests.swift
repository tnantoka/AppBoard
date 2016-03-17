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
    
    func testCreateBoard() {
        let app = XCUIApplication()
        let name = "Board Name"
        let count = app.cells.count + 1
        
        app.navigationBars.buttons["Add"].tap()
        
        let alert = app.alerts["Add New Board"]
        alert.textFields.elementBoundByIndex(0).typeText(name)
        alert.buttons["Add"].tap()

        XCTAssertEqual(app.cells.count, count)
        let cell = app.cells.staticTexts[name]
        XCTAssert(cell.exists)
    }
}
