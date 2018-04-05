//
//  QuickSort.swift
//  Practice
//
//  Created by Greg Price on 3/31/18.
//

import Foundation

public func quick(_ ints: inout [Int]) {
    divide(&ints, thisStart: 0, thisEnd: ints.count - 1)
}

fileprivate func divide(_ ints: inout [Int], thisStart: Int, thisEnd: Int) {
    if thisStart < thisEnd {
        let p = partition(&ints, start: thisStart, p: thisEnd)
        divide(&ints, thisStart: thisStart, thisEnd: p - 1)
        divide(&ints, thisStart: p + 1, thisEnd: thisEnd)
    }
}

fileprivate func partition(_ ints: inout [Int], start: Int, p: Int) -> Int {
    var leftPileFrontIdx = start - 1
    for i in start..<p {
        if ints[i] <= ints[p] {
            leftPileFrontIdx += 1
            swap(&ints, idx1: leftPileFrontIdx, idx2: i)
        }
    }
    swap(&ints, idx1: leftPileFrontIdx + 1, idx2: p)
    return leftPileFrontIdx + 1
}

fileprivate func swap( _ ints: inout [Int], idx1: Int, idx2: Int) {
    let t = ints[idx2]
    ints[idx2] = ints[idx1]
    ints[idx1] = t
}
