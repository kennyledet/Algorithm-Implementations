//
//  MaxSubarrayBruteTest.swift
//  PracticePackageDescription
//
//  Created by Greg Price on 4/1/18.
//

import XCTest

class MaxSubarrayBruteTest: XCTestCase {
    func test() {
        var vals = [-2, 1, -3, 4, -1, 2, 1, -5, 4]
        vals = maxSubarrayBrute(ints: vals)
        assert(vals.elementsEqual([4, -1 ,2, 1]))
    }
}
