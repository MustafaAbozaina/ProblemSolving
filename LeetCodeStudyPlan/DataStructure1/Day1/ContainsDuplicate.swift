//
//  ContainsDuplicate.swift
//  LeetCodeStudyPlan
//
//  Created by mustafa salah eldin on 9/5/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

class ContinasDuplicateTests: XCTestCase {
    
    func test_containsDuplicate_shouldReturnTrue_inCaseDuplicateElements() {
        let numbers = [1,2,3,4,3]
        
        XCTAssertTrue(containsDuplicate(numbers))
    }
    
    func test_containsDuplicates_shouldReturnFalse_inCaseNoDuplicates() {
        let numbers = [1,2,3,4]
        
        XCTAssertFalse(containsDuplicate(numbers))
    }
    
    func containsDuplicate(_ nums: [Int]) -> Bool {
        return nums.count != Set(nums).count ? true : false
    }
    
    func containsDuplicatePerformanceBetter(_ nums: [Int]) -> Bool {
        var dic = [Int: Bool]()
        for number in nums {
            if dic[number] != nil {
                return true
            }
            dic[number] = true
        }
        return false
    }
}

///https://leetcode.com/problems/contains-duplicate/
/*Given an integer array nums, return true if any value appears at least twice in the array, and return false if every element is distinct.
 
 
 
 Example 1:
 
 Input: nums = [1,2,3,1]
 Output: true
 Example 2:
 
 Input: nums = [1,2,3,4]
 Output: false
 Example 3:
 
 Input: nums = [1,1,1,3,3,4,3,2,4,2]
 Output: true
 */
