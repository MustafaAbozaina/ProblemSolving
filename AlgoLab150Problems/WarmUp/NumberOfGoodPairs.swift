//
//  NumberOfGoodPairs.swift
//  AlgoLab150Problems
//
//  Created by Mustafa Abozaina on 06/02/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//
// https://leetcode.com/problems/number-of-good-pairs

import XCTest

class NumberOfGoodPairsTests: XCTestCase {
    func numIdenticalPairs(_ nums: [Int]) -> Int {
        // dicionray value if repaeted more than 2, like If It's 3, this means It's repeated 4 times the first and two values will paired with the 3 one
        // This is related to permuation 
        var numberOfGoodPair = 0
        for i in 0..<nums.count {
            for j in i+1..<nums.count {
                if nums[i] == nums[j] {
                    numberOfGoodPair += 1
                }
            }
        }
        return numberOfGoodPair
    }
}
