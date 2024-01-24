//
//  ContainsDuplicate.swift
//  AlgoLab150Problems
//
//  Created by Mustafa Abozaina on 15/01/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//
// 4. Contains Duplicate: https://leetcode.com/problems/contains-duplicate

import XCTest

final class ContainsDuplicate: XCTestCase {

    func test() {
        XCTAssertEqual(containsDuplicate([1,2,3,4,5,6]), false)
        XCTAssertEqual(containsDuplicate([1,2,3,4,5,6,2]), true)
    }
   
    func containsDuplicate(_ nums: [Int]) -> Bool {
            var dic = [Int: Int]()
            for number in nums {
                if dic[number] == nil {
                    dic[number] = 1
                } else {
                   return true
                }
            }
            return false
        }
}
