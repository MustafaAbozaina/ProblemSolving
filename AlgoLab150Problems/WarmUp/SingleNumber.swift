//
//  SingleNumber.swift
//  AlgoLab150Problems
//
//  Created by Mustafa Abozaina on 15/01/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//
// 3. Single Number: https://leetcode.com/problems/single-number

import XCTest

final class SingleNumber: XCTestCase {
    
    func test_singleElement() {
        let singleNums = [1,2,3,1,2]
        XCTAssertEqual(singleNumber(singleNums), 3)
    }
    
    func test_twoSingleElements() {
        let singleNums = [1,2,3,1,2,4]
        XCTAssertEqual(twoSingleNumbers(singleNums), [3,4])
    }
    
    func singleNumber(_ nums: [Int]) -> Int {
        // Convert arr to dic
        // key is equal to the number the value is repetition
        
        // we could add every element and adding Its repetition and In the end we gonna loop through elements, but this solution will have some problems, because this requires to loop through dictionaries element and check which elmenet contains 1 repetition,
        
        // but If we delete any number that repeated more than once, we will get one Item at the end and the complexity here will be O(1)
        
        // So to know repetitions we should loop through all the nums array
        var dic = [Int: Int]()
        for number in nums {
            if dic[number] == nil {
                dic[number] = 1
            } else {
                dic[number] = nil
            }
        }
        return dic.keys.first ?? 0
        
    }
    
    func twoSingleNumbers(_ nums: [Int]) -> [Int] {
        // So to know repetitions we should loop through all the nums array
        var dic = [Int: Int]()
        for number in nums {
            if dic[number] == nil {
                dic[number] = 1
            } else {
                dic[number] = nil
            }
        }
        return Array(dic.keys)
    }
}

