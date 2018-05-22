//
//  QuickSortTest.swift
//  Practice
//
//  Created by Greg Price on 3/31/18.
//

import Foundation

class QuickSortTest: XCTestCase {
    func quickSortTest()  {
        var vals = [43, 44, 2, 98, 28]
        quick(&vals)
        assert(vals.elementsEqual([2, 28, 43, 44, 98]))
    }
}
