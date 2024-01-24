//
//  NumberOfSubArraysOfSizeK.swift
//  AlgoLab150Problems
//
//  Created by Mustafa Abozaina on 16/02/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//
// https://leetcode.com/problems/number-of-sub-arrays-of-size-k-and-average-greater-than-or-equal-to-threshold

import XCTest

class NumberOfSubArraysOfSizeK: XCTestCase {
    
    func test() {
        let input = [1,1,1,1,1]
        let expected = 5
        let k = 1
        let threshould = 0
        XCTAssertEqual(numOfSubarrays(input, k, threshould), expected)
        XCTAssertEqual(numOfSubarraysUsingSlidingwindowWithForLoop(input, k, threshould), expected)
        XCTAssertEqual(numOfSubarraysUsingSlidingWindowWithWhile(input, k, threshould), expected)
        XCTAssertEqual(numOfSubarraysUsingSlidingWindowFromSolutions(input, k, threshould), expected)
    }
    
    func numOfSubarrays(_ arr: [Int], _ k: Int, _ threshold: Int) -> Int {
        // should have last value to substract
        // having the value of avarage and compare with threshold
        var numberOfAchievedCondition = 0
        var sum = 0
        var firstIndexedValue = 0
        for i in 0..<arr.count - (k - 1) {
            //  sum -= firstIndexedValue
            sum = 0
            // adding depending on k
            for j in 0...k - 1 {
                sum += arr[i+j]
            }
            //  sum = arr[i] + arr[i+1] + arr[i+2]
            firstIndexedValue = arr[i]
            if (sum / k) >= threshold {
                numberOfAchievedCondition += 1
            }
        }
        return numberOfAchievedCondition
    }
    
    func numOfSubarraysUsingSlidingwindowWithForLoop(_ arr: [Int], _ k: Int, _ threshold: Int) -> Int {
        // should have last value to substract
        // having the value of avarage and compare with threshold
        var numberOfAchievedCondition = 0
             var sum = 0
             var droppedValue = 0
              for i in (k - 1)..<arr.count {
                 //  sum -= firstIndexedValue
                  // adding depending on k
                
                  if i == k - 1 {
                      for j in 0...k - 1 {
                          sum += arr[j]
                      }
                      droppedValue = arr[0]
                  } else {
                      sum += arr[i]
                      sum -= droppedValue
                    droppedValue = arr[i-k+1]
                  }
                  
                 //  sum = arr[i] + arr[i+1] + arr[i+2]
                  if (sum / k) >= threshold {
                     numberOfAchievedCondition += 1
                  }
              }
              return numberOfAchievedCondition
    }
    
    func numOfSubarraysUsingSlidingWindowWithWhile(_ arr: [Int], _ k: Int, _ threshold: Int) -> Int {
        // should have last value to substract
        // having the value of avarage and compare with threshold
        var numberOfAchievedCondition = 0
        var sum = 0
        var droppedValue = 0
        var i = 0
        while i < arr.count {
            //   for i in k..<arr.count {
            //  sum -= firstIndexedValue
            // adding depending on k
            
            if i == 0 {
                for j in 0..<k {
                    sum += arr[j]
                    i = k
                }
            } else {
                sum += arr[i]
                sum -= droppedValue
                i += 1
            }
            droppedValue = arr[i-k]
            //  sum = arr[i] + arr[i+1] + arr[i+2]
            if (sum / k) >= threshold {
                numberOfAchievedCondition += 1
            }
        }
        return numberOfAchievedCondition
    }
    
    func numOfSubarraysUsingSlidingWindowFromSolutions(_ arr: [Int], _ k: Int, _ threshold: Int) -> Int {
            let n = arr.count
            var result = 0
            var sum = 0

            for i in 0 ..< k - 1 {
                sum += arr[i]
            }

            for i in k - 1 ..< n {
                sum += arr[i]

                if sum / k >= threshold {
                    result += 1
                }
                sum -= arr[i + 1 - k]
            }
            return result
        }
}
