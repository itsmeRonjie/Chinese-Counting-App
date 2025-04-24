//
//  Chinese_CountingTests.swift
//  Chinese CountingTests
//
//  Created by Ronjie Diafante Man-on on 4/24/25.
//

import XCTest
@testable import Chinese_Counting

final class Chinese_CountingTests: XCTestCase {

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func testReturnsEmptyWhenCountExceedsRange() {
        XCTAssertEqual(
            0.generateUniqueNumbers(count: 6, lower: 1, upper: 5),
            []
        )
    }
    
    
    func testNumbersWithinRange() {
        let lower = 5
        let upper = 15
        let result = 0.generateUniqueNumbers(count: 5, lower: lower, upper: upper)
        
        for number in result {
            XCTAssertTrue((lower...upper).contains(number))
        }
    }
}
