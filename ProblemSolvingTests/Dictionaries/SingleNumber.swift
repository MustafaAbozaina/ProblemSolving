//
//  SingleNumber.swift
//  ProblemSolvingTests
//
//  Created by mustafa salah eldin on 6/24/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

class SingleNumberTest: XCTestCase {
    func test_singleNumber(_ nums: [Int]) -> Int {
        var dic = [Int: Bool]()
        for number in nums {
            if dic[number] == true {
                dic[number] = nil
            } else {
            dic[number] = true
            }
        }
        let element = dic.keys.first ?? -1
        return element
    }
}

class MajorityElementTest {
    func majorityElement(_ nums: [Int]) -> Int {
        var numbersDic = [Int: Int]()
        
        for number in nums {
            numbersDic[number] = (numbersDic[number] ?? 0) + 1
        }
        var maxValue = 0
        var keyValue = 0
        for (key, value) in numbersDic  {
            if value > maxValue {
                maxValue = value
                keyValue = key
            }
        }
        return keyValue

    }
}
