//
//  PredicatesTests.swift
//  Structure
//
//  Created by James Bean on 12/23/16.
//
//

import XCTest

class PredicatesTests: XCTestCase {

    func testIsHomogenousEmptyTrue() {
        XCTAssert(Array<Int>().isHomogeneous)
    }

    func testIsHomogenousSingleElementTrue() {
        XCTAssert([1].isHomogeneous)
    }

    func testIsHomoegeneous() {
        XCTAssert([1,1,1,1,1].isHomogeneous)
    }

    func testIsHomogeneousFail() {
        XCTAssertFalse([1,2,1,1].isHomogeneous)
    }

    func testIsHeterogeneousFalse() {
        XCTAssertFalse([1,1,1,1,1].isHeterogeneous)
    }
}