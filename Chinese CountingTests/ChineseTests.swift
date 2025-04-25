//
//  Chinese.swift
//  Chinese CountingTests
//
//  Created by Ronjie Diafante Man-on on 4/25/25.
//

import XCTest
@testable import Chinese_Counting

final class ChineseTests: XCTestCase {

    func testChinese() throws {
        let nums = [0,3,10,13,17,20,28,39,51,99]
        let nilNums: [Int] = [100, -10, 101, 102, -1, -2]
        
        let expectedValues: [(chinese: String, pinyin: String)?] = [
            ("零", "líng"),
            ("三", "sān"),
            ("十", "shí"),
            ("十三", "shí sān"),
            ("十七", "shí qī"),
            ("二十", "èr shí"),
            ("二十八", "èr shí bā"),
            ("三十九", "sān shí jiǔ"),
            ("五十一", "wǔ shí yī"),
            ("九十九", "jiǔ shí jiǔ")
        ]
        
        for i in 0..<nums.count {
            let value1 = ChineseTests
                .num99ToChinese(num: nums[i])
            
            XCTAssertNotNil(value1)
            
            let value2 = expectedValues[i]
            if let value1, let value2 {
                XCTAssertEqual(value1.chinese, value2.chinese)
                XCTAssertEqual(value1.pinyin, value2.pinyin)
            }
        }
        
        for num in nilNums {
            XCTAssertNil(ChineseTests.num99ToChinese(num: num))
        }
    }
    
}
