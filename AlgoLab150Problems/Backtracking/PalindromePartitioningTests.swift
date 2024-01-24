//
//  PalindromePartitioningTests.swift
//  AlgoLab150Problems
//
//  Created by Mustafa Abozaina on 08/06/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//
//https://leetcode.com/problems/palindrome-partitioning

import XCTest


final class PalindromePartitioningTests: XCTestCase {

    func test() {
        XCTAssertEqual(Set(partition("aaab")), Set([["a", "a", "a", "b"], ["a", "aa", "b"], ["aa", "a", "b"], ["aaa", "b"]]))
    }

        func partition(_ s: String) -> [[String]] {
        
        var result: [[String]] = []
            backtrack(0, [], s: s, result: &result)
        return result
    }
    
    func isPalindrome(_ string: String) -> Bool {
        return string == String(string.reversed())
    }
    
    func backtrack(_ start: Int, _ currPartition: [String], s: String, result: inout [[String]]) {
        if start == s.count {
            result.append(currPartition)
            return
        }
        
        let sArray = Array(s)
        for end in start..<s.count {
            let substring = String(sArray[start...end])
            if isPalindrome(substring) {
                backtrack(end + 1, currPartition + [substring], s: s, result: &result)
            }
        }
    }
 
    // - Complexity:
    //   - time: O(n * 2^n), where n is the length of s.
    //   - space: O(n^2), where n is the length of s.
    func partitionDFS(_ s: String) -> [[String]] {
            let n = s.count
            var dp = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
            var ans = [[String]]()
            var currentList = [String]()

            dfs(&ans, str: Array(s), n: n, start: 0, &currentList, &dp)
            return ans
        }

        
        private func dfs(_ ans: inout [[String]], str: [Character], n: Int, start: Int, _ currentList: inout [String], _ dp: inout [[Bool]]) {
            guard start < n else { ans.append(currentList); return }
                
            for end in start..<n {
                guard str[start] == str[end], (end - start <= 2 || dp[start + 1][end - 1]) else { continue }
                dp[start][end] = true
                currentList.append(String(str[start...end]))
                dfs(&ans, str: str, n: n, start: end + 1, &currentList, &dp)
                currentList.removeLast()
            }
        }
    
}
