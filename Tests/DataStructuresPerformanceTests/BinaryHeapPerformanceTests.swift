//
//  BinaryHeapPerformanceTests.swift
//  DataStructuresPerformanceTests
//
//  Created by James Bean on 7/18/18.
//

import XCTest
import PerformanceTesting
import DataStructures

class BinaryHeapPerformanceTests: PerformanceTestCase {

    var random: (element: Int, value: String) {
        let value = Int.random(in: 1...100)
        return (value, "\(value)")
    }

    /// Guarantee that insertion into `BinaryHeap` is O(1).
    func testInsert_O_1() {
        assertPerformance(.constant) { size in
            meanOutcome {
                var heap = BinaryHeap<Int,String>((0...size).map { _ in random })
                return time {
                    let (element,value) = random
                    _ = heap.insert(element,value)
                }
            }
        }
    }

    /// Guarantee that popping the minimum value from `BinaryHeap` is O(1).
    func testPop_O_1() {
        assertPerformance(.constant) { size in
            meanOutcome {
                var heap = BinaryHeap<Int,String>((0...size).map { _ in random })
                return time {
                    let _ = heap.pop()
                }
            }
        }
    }
}
