//
//  bubble_sort.swift
//  SecurifyNotes
//
//  Created by Tarang khanna on 6/16/15.
//  Copyright (c) 2015 Tarang khanna. All rights reserved.
//


/*Bubble sort, sometimes referred to as sinking sort, is a simple sorting algorithm that repeatedly steps through the list to be sorted, compares each pair of adjacent items and swaps them if they are in the wrong order. The pass through the list is repeated until no swaps are needed, which indicates that the list is sorted. The algorithm, which is a comparison sort, is named for the way smaller elements bubble to the top of the list. Although the algorithm is simple, it is too slow and impractical for most problems even when compared to insertion sort. It can be practical if the input is usually in sort order but may occasionally have some out-of-order elements nearly in position. Bubble sort has worst-case and average complexity both ( n 2 ), where n is the number of items being sorted. There exist many sorting algorithms with substantially better worst-case or average complexity of O ( n log n ). Even other ( n 2 ) sorting algorithms, such as insertion sort, tend to have better performance than bubble sort. Therefore, bubble sort is not a practical sorting algorithm when n is large. https://en.wikipedia.org/wiki/Bubble_sort
*/

import Foundation

public class bubble_sort {
    
    
    func bubbleSort(var numberList: Array<Int>) ->Array<Int> {
        
        var x, y, z, passes, key : Int
        
        // track collection iterations
        for x in 0..<numberList.count {
            
            passes = (numberList.count - 1) - x;
            
            // use shorthand "half-open" range operator
            
            for y in 0..<passes {
                key = numberList[y]
                
                println("comparing \(key) and \(numberList[y + 1])")
                
                // this is the swap
                // move n to the posistion of n-1
                if (key > numberList[y + 1]) {
                    
                    z = numberList[y + 1]
                    numberList[y + 1] = key
                    numberList[y] = z
                    
                }
                
            } //end for
            
        } //end for
        
        
        return numberList
        
    } //end function
    
}