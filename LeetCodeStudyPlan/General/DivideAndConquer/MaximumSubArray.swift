//
//  MaximumSubArray.swift
//  LeetCodeStudyPlan
//
//  Created by mustafa salah eldin on 9/9/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

class MaximumSubArray: XCTestCase {
    var maximum = 0
    func test_divideAndConquer() {
        let value = recursive([-2,1,-3,4,-1,2,1,-5,4])
        XCTAssertEqual(value, [1,2,3])
    }
    
    func recursive(_ arr:[Int]) -> [Int] {
        // base
        if arr.count == 1 {
            return arr
        }
        
        let left = Array(arr[0..<Int(arr.count/2)])
        let right = Array(arr[Int(arr.count/2)..<arr.count])
        
        let value = recursive(left) + recursive(right)
        
        let tempo = value.reduce(0, +)
        if maximum < tempo {
            maximum = tempo
        }
        
        return value
    }

}
