//
//  PalindromePartitioningCuts.swift
//  AlgoLab150Problems
//
//  Created by Mustafa Abozaina on 10/06/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//
// https://leetcode.com/problems/palindrome-partitioning-ii/description/

import XCTest

final class PalindromePartitioningCuts: XCTestCase {
    
    func test() {
        XCTAssertEqual(minCut("aaaa"), 1)
    }
    
    func minCut(_ s: String) -> Int {
        var result: [[String]] = []
        backtrack(start: 0, currentPartition: [], s: s, result: &result)
        var minCut = 100
        let a = Set<Int>()

        for arr in result {
            if arr.count < minCut {
                minCut = arr.count
            }
        }
        print(result)
        return minCut - 1
    }
    
    func backtrack(start: Int, currentPartition: [String], s: String, result: inout [[String]]) {
        if start == s.count {
            result.append(currentPartition)
            return
        }
        let sArray = Array(s)
        for end in start..<s.count {
            let substring = String(sArray[start...end])
            if isPalindrome(substring) {
                backtrack(start: end + 1, currentPartition: currentPartition + [substring], s: s, result: &result)
            }
        }
    }
    
    func isPalindrome(_ str: String) -> Bool {
        return String(str.reversed()) == str
    }
}
