//
//  BoardTests.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/17/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import XCTest
@testable import AppBoard

class BoardTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testApps() {
        let account = Account()
        let board = Board()
        let app = App()
        let boardName = "Board Name"
        board.name = boardName
        let appName = "App Name"
        app.name = appName
        account.addNewItem(board)
        board.addNewItem(app)
        XCTAssertEqual(board.apps.count, 1)
        XCTAssertEqual(board.all.first?.name, appName)
        XCTAssertEqual(app.board.name, boardName)
        
        board.deleteItemAtIndex(0)
        XCTAssertEqual(board.apps.count, 0)
    }
}
