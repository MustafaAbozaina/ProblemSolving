//
//  ConcatenationOfArray.swift
//  AlgoLab150Problems
//
//  Created by Mustafa Abozaina on 16/02/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//

import XCTest
//https://leetcode.com/problems/concatenation-of-array

class ConcatenationOfArrayTests: XCTestCase {
    
    func test() {
        XCTAssertEqual(getConcatenation([1,3,2,1]), [1,3,2,1,1,3,2,1])
        XCTAssertEqual(getConcatenationOptimized([1,3,2,1]), [1,3,2,1,1,3,2,1])
    }
    
    func getConcatenation(_ nums: [Int]) -> [Int] {
        var ans = Array(repeating: 0, count: nums.count * 2)
        for i in 0..<nums.count {
            ans[i] = nums[i]
            ans[i+nums.count] = nums[i]
        }
        return ans
    }
    
    func getConcatenationOptimized(_ nums: [Int]) -> [Int] {
        return nums + nums
    }
    
}
