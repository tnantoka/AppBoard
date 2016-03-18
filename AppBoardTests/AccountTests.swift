//
//  AccountTests.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/18/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import XCTest
@testable import AppBoard

class AccountTests: XCTestCase {
    
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
    
    func testAll() {
        let account = Account()
        let board = Board()
        let name = "Board Name"
        let count = account.all.count + 1
        board.name = name
        account.addNewItem(board)
        XCTAssertEqual(account.all.count, count)
        XCTAssertEqual(account.all.first?.name, name)
    }
}
