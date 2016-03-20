//
//  SearchTests.swift
//  AppBoard
//
//  Created by Tatsuya Tobioka on 3/20/16.
//  Copyright © 2016 Tatsuya Tobioka. All rights reserved.
//

import XCTest
import APIKit
@testable import AppBoard

class SearchTests: XCTestCase {
    
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
        let expectation = expectationWithDescription("")

        let search = Search()
        let request = ITunesAPI.SearchSoftwaresRequest(query: "TimeCrowd").requestWithPage(1)
        Session.sendRequest(request) { result in
            switch result {
            case .Success(let response):
                search.results = response.elements
                XCTAssertEqual(search.all.first?.app.name, "TimeCrowd")
                expectation.fulfill()
            default:
                XCTFail()
            }
        }
        
        waitForExpectationsWithTimeout(10.0, handler: nil)
    }
}

