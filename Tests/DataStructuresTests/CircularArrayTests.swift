//
//  CircularArrayTests.swift
//  Structure
//
//  Created by James Bean on 6/6/17.
//
//

import XCTest
import DataStructures

class CircularArrayTests: XCTestCase {

    func testEquatable() {
        let a: CircularArray = [1,2,3,4,5]
        let b: CircularArray = [1,2,3,4,5]
        XCTAssertEqual(a,b)
    }

    func testElementAtZero() {
        let array = CircularArray([0,1,2,3,4,5])
        XCTAssertEqual(array[circular: 0], 0)
    }

    func testElementInTheMiddle() {
        let array = CircularArray([0,1,2,3,4,5])
        XCTAssertEqual(array[circular: 3], 3)
    }

    func testElementAtTheEnd() {
        let array = CircularArray([0,1,2,3,4,5])
        XCTAssertEqual(array[circular: 5], 5)
    }

    func testElementOutOfNormalBounds() {
        let array = CircularArray([0,1,2,3,4,5])
        XCTAssertEqual(array[circular: 7], 1)
    }

    func testRangeInOrderWithinBounds() {
        let array = CircularArray([0,1,2,3,4,5])
        let subrange = array[from: 2, through: 4]
        let expected = [2,3,4]
        XCTAssertEqual(subrange, expected)
    }

    func testRangeInOrderOverflow() {
        let array = CircularArray([0,1,2,3,4,5])
        let subrange = array[from: 4, through: 9]
        let expected = [4,5,0,1,2,3]
        XCTAssertEqual(subrange, expected)
    }

    func testRangeOutOfOrderOverflow() {
        let array = CircularArray([0,1,2,3,4,5])
        let subrange = array[from: 4, through: 1]
        let expected = [4,5,0,1]
        XCTAssertEqual(subrange, expected)
    }

    func testRangeAfterUpToOutOfOrderOverflow() {
        let array = CircularArray([0,1,2,3,4,5])
        let subrange = array[after: 4, upTo: 1]
        let expected = [5,0]
        XCTAssertEqual(subrange, expected)
    }

    func testSequence() {
        let array = CircularArray([0,1,2,3,4,5])
        let expected = [0,1,2,3,4,5]
        let result = array.map { $0 }
        XCTAssertEqual(result, expected)
    }

    func testCollection() {
        let array = CircularArray([0,1,2,3,4,5])
        XCTAssertEqual(array.first!, 0)
        XCTAssertEqual(array.last!, 5)
    }

    func testReversed() {
        let array = CircularArray([0,1,2,3,4,5])
        let reversed = array.reversed()
        let expected = CircularArray([5,4,3,2,1,0])
        XCTAssertEqual(reversed.map { $0 }, expected.map { $0 })
    }
}
