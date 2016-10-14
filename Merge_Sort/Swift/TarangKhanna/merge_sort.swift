import Foundation
 
// Build 100 random numbers between 0 and 100
var numbers = Int[]()
for i in 1..100 {
    let n = Int(arc4random() % 101)
    numbers.append(n)
}
 
func elementsInRange<T>(a: T[], start: Int, end: Int) -> (T[]) {
    var result = T[]()
    
    for x in start..end {
        result.append(a[x])
    }
    
    return result
}
 
func merge<T: Comparable>(a: T[], b: T[], mergeInto acc: T[]) -> T[] {
    if a == [] {
        return acc + b
    } else if b == [] {
        return acc + a
    }
    
    if a[0] < b[0] {
        return merge(elementsInRange(a, 1, a.count), b, mergeInto: acc + [a[0]])
    } else {
        return merge(a, elementsInRange(b, 1, b.count), mergeInto: acc + [b[0]])
    }
}
 
func mergesort<T: Comparable>(a: T[]) -> T[] {
    if a.count <= 1 {
        return a
    } else {
        let firstHalf = elementsInRange(a, 0, a.count/2)
        let secondHalf = elementsInRange(a, a.count/2, a.count)
        
        return merge(mergesort(firstHalf), mergesort(secondHalf), mergeInto: [])
    }
}
 
let sorted = mergesort(numbers)
 
println(sorted)