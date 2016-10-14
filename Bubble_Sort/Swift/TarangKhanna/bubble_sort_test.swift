//
//  bubble_sort_test.swift
//  SecurifyNotes
//
//  Created by Tarang khanna on 6/16/15.
//  Copyright (c) 2015 Tarang khanna. All rights reserved.
//

import Foundation

func testBubbleSort() { // swift 1.2 compatible
    
    let numberList : Array<Int> = [4, 3, 23, 2, 14, 41, 15,12] 
    var bubbleSortTest: bubble_sort = bubble_sort()
    XCTAssertNotNil(bubbleSortTest, "sorting instance not created..")
    
    // pass the list to be sorted
    var resultList: Array<Int>! = bubbleSortTest.bubbleSort(numberList)
    
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

// future improvements- sorting for other data types too