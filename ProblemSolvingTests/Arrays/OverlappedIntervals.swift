//
//  OverlappedIntervals.swift
//  ProblemSolvingTests
//
//  Created by mustafa salah eldin on 6/27/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

class OverlappedIntervals: XCTestCase {
    func merge(_ intervals: [[Int]]) -> [[Int]] {
        // overlapping means two intervals has intersection point
        // So take the first of the first array and second number of the second array creating the new array
        
        // Q: How to check if two arrays intersected
        // Note: we should loop through all intervals array
        
        // Brute force solution:
        // 1- loop through interval
        // 2- for earch one check if the largest number of the array greater than smallest in next element
        
        // probelm: Complexity O(N2)
        
        // Suggested another solution:
        // we can use two pointers because the array is considered sorted
        // Exmaple: first pointer will be first index then search ascendingly
        // if the the second pointer contains an array that intersected so complete to the next
        // Else increase the second Pointer till find non intersected array => then increase first pointer
        // always second pointer will first equal first + 1
        
        // function called intersected should have an array and integer
        // The array is that second pointer pointing to It
        
        // try second suggestions
        
        // steps:
        // define var [[]] before loop for adding new intervals overlaps
        // loop through the intervals array
        // each loop cycle start = 0, end = start+1
        // take currentInterval.last
        // take nextInterval.Last
        // if nextIntervalLast > currentIntervalLast then isIntersectedTrue else false
        // If isInteresected is true increase secondPointer else continue
        
        // Where to add the new array?
        // In new array<array> defined before the loop appending firstElement + SecondElement
        
        var overlappedIntervals = [[Int]]()
        
        for i in 0..<intervals.count {
            var start = i
            var end = i+1
            let boundaryOfFirstInterval = intervals[start].last ?? -1
            let boundaryOfSecondInterval = intervals[end].last ?? -1
            var isIntersected = isBothIntervalsIntersected(firstBoundary: boundaryOfFirstInterval , secondBoundary: boundaryOfSecondInterval)
            
            if isIntersected {
                overlappedIntervals.append([boundaryOfFirstInterval, boundaryOfSecondInterval])
                end += 1
            } else {
                continue
            }
            
        }
        return overlappedIntervals
    }
    
    func isBothIntervalsIntersected(firstBoundary: Int, secondBoundary: Int) -> Bool {
        return secondBoundary > firstBoundary ? true : false
    }
}
