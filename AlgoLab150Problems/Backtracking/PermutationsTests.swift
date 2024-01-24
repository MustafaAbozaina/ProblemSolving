//
//  PermutationsTests.swift
//  AlgoLab150Problems
//
//  Created by Mustafa Abozaina on 07/06/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//
// https://leetcode.com/problems/permutations

import XCTest

final class PermutationsTests: XCTestCase {

    func test_permutation() {
        let input = [1,2,3]
        let expectedOutput = Set([[1, 2, 3], [1, 3, 2], [2, 1, 3], [2, 3, 1], [3, 1, 2], [3, 2, 1]])
        XCTAssertEqual(Set(permute(input)), expectedOutput)
        XCTAssertEqual(Set(permuteInner(input)), expectedOutput)
    }
    
    func permute(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        backtrack(currentSet: [], index: 0, nums: nums, result: &result)
        result = result.filter({$0.count == nums.count })
        return result
    }
    
    func permuteInner(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        result = backtrackInner(currentSet: [], index: 0, nums: nums)
        result = result.filter({$0.count == nums.count })
        return result
    }
    
    func backtrack(currentSet: [Int], index: Int, nums: [Int], result: inout [[Int]]) {
        result.append(currentSet)
        
        // take one element and remove It from rest array
        // loop though others
        for i in 0..<nums.count {
            var updatedSet = currentSet
            updatedSet.append(nums[i])
            backtrack(currentSet: updatedSet, index: i + 1, nums: nums.filter({$0 != nums[i]}), result: &result)
        }
    }
    
    func backtrackInner(currentSet: [Int], index: Int, nums: [Int]) -> [[Int]] {
        var result1 = [[Int]]()
        result1.append(currentSet)
        // take one element and remove It from rest array
        // loop though others
        for i in 0..<nums.count {
            var updatedSet = currentSet
            updatedSet.append(nums[i])
            result1.append(contentsOf: backtrackInner(currentSet: updatedSet, index: i + 1, nums: nums.filter({$0 != nums[i]})))
        }
        return result1
    }
}
