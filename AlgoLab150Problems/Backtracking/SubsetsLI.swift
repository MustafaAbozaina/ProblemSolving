//
//  SubsetsLI.swift
//  AlgoLab150Problems
//
//  Created by Mustafa Abozaina on 03/06/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//
//https://leetcode.com/problems/subsets-ii/description/

import XCTest

final class SubsetsLI: XCTestCase {

    func test() {
        XCTAssertEqual(subsetsWithDup([1,2,2]), [[],[1],[1,2],[1,2,2],[2],[2,2]])
    }

    func subsetsWithDup(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        backtrack(currentSet: [], index: 0, nums: nums, result: &result)
        var summitionSet = Set<String>()
        var duplicatedIndices = [Int]()
        for i in 0..<result.count {
            if isDuplicated(arr: result[i], set: &summitionSet) {
                duplicatedIndices.append(i)
            }
        }
        
        let sortedIndices = duplicatedIndices.sorted(by: >)
        for i in sortedIndices {
            if result[i] == [0] {
                continue
            }
            result.remove(at: i)
        }
        return result
    }
    
    func backtrack(currentSet: [Int], index: Int, nums: [Int], result: inout [[Int]])  {
        result.append(currentSet)
        
        for i in index..<nums.count {
            var updatedSet = currentSet
            updatedSet.append(nums[i])
            backtrack(currentSet: updatedSet, index: i + 1, nums: nums, result: &result)
        }
    }
    
    func isDuplicated(arr: [Int], set: inout Set<String>) -> Bool {
        if arr == [0] {
            set.insert("0")
        }
        let stringArr = arr.sorted().map{"\($0)"}
        let summition = stringArr.reduce("", +)
        if !set.contains(summition) {
            set.insert(summition)
            return false
        } else {
            return true
        }
    }
}
