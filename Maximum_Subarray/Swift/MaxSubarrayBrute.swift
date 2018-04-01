//
//  MaxSubarrayBrute.swift
//
//  Created by Greg Price on 4/1/18.
//

import Foundation

func maxSubarrayBrute(ints: [Int]) -> [Int] {
    var m = 0
    var startIndex = 0
    var endIndex = 0
    for i in 0..<ints.count {
        var sum = 0
        for j in i..<ints.count {
            sum += ints[j]
            if sum > m {
                m = sum
                startIndex = i
                endIndex = j
            }
        }
    }
    return Array(ints[startIndex...endIndex])
}
