//
//  merge_sort_test.swift
//  
//
//  Created by Tarang khanna on 7/29/15.
//
//

import Foundation

func testBubbleSort() { // swift 1.2 compatible
    
    let numberList : Array<Int> = [4, 3, 23, 2, 14, 41, 15,12]
    var mergeSortTest: merge_sort = merge_sort()
    
    // pass the list to be sorted
    var resultList: Array<Int>! = mergeSortTest.mergesort(numberList)
    
    // determine if the numbers are sorted
    var x: Int = 0
    for (x = 0; x < resultList.count; x++) {
        
        if ((x > 0) && (resultList[x] < resultList[x - 1])) {
            XCTFail("numberlist items not in sorted order")
        }
        else {
            println("item \(resultList[x]) is sorted")
        }
        
        
    } // end for
    
    
    
} // end function

// supports all datatypes using generics 