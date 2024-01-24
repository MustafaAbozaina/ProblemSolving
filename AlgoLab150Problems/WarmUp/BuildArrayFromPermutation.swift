//
//  File.swift
//  AlgoLab150Problems
//
//  Created by Mustafa Abozaina on 15/02/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//

import XCTest
//https://leetcode.com/problems/build-array-from-permutation/description/

class BuildArrayFromPermutationTests: XCTestCase {
    
    func test() {
        let input = [0,2,1,5,3,4]
        let expected = [0,1,2,4,5,3]
        XCTAssertEqual(buildArray(input), expected)
    }
    
    func buildArray(_ nums: [Int]) -> [Int] {
        var ans = Array(repeating: 0, count: nums.count)
        for i in 0..<nums.count {
            ans[i] = nums[nums[i]]
        }
        return ans
    }
}

////
///Explanation: The array ans is built as follows:
// ans = [nums[nums[0]], nums[nums[1]], nums[nums[2]], nums[nums[3]], nums[nums[4]], nums[nums[5]]]
// = [nums[0], nums[2], nums[1], nums[5], nums[3], nums[4]]
// = [0,1,2,4,5,3]
