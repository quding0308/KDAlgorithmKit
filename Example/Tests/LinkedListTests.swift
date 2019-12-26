//
//  LinkedListTests.swift
//  KDAlgorithmKit_Tests
//
//  Created by hour on 2019/12/26.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import XCTest
import KDAlgorithmKit

class LinkedListTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        var arr = [2, 3, 4, 1, 5, 2]
        SortAlgorithm.bubleSort(arr: &arr)
        
        let list = LinkedList<String>()
        XCTAssert(list.isEmpty) // true
        XCTAssert(list.head == nil)                    // nil
        XCTAssert(list.last == nil)                     // nil

        list.append("Hello")
        XCTAssert(!list.isEmpty)
        XCTAssert(list.head != nil)
        XCTAssert(list.last != nil)
        XCTAssert(!list.isEmpty)                  // false
        XCTAssertNotNil(list.head!.value)
        XCTAssertNotNil(list.last!.value)
        XCTAssert(list.count == 1)

        list.append("World")
        XCTAssertEqual(list.head!.value, "Hello")
        XCTAssertEqual(list.last!.value, "World")
        XCTAssertEqual(list.count, 2)

        XCTAssertNil(list.head!.previous)
        XCTAssertNil(list.last!.next)
        
        XCTAssertEqual(list.last!.value, "World")
        XCTAssertEqual(list.last!.previous!.value, "Hello")
        XCTAssertEqual(list.last!.value, "World")

        XCTAssertEqual(list.node(at: 0).value, "Hello")
        XCTAssertEqual(list.node(at: 1).value, "World")

        XCTAssertEqual(list[0], "Hello")
        XCTAssertEqual(list[1], "World")
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
