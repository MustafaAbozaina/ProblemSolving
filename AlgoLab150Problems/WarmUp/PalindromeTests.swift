//
//  PalindromeTests.swift
//  AlgoLab150Problems
//
//  Created by Mustafa Abozaina on 14/01/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//

// 1. Palindrome Number: https://leetcode.com/problems/palindrome-number
import XCTest

final class PalindromeTests: XCTestCase {

    class PalindromeInt: XCTestCase {
        
        func test() {
            let isPali = isPalindrome(x: 112211)
            XCTAssertEqual(isPali, true)
        }
        
        func isPalindrome(x: Int) -> Bool {
            let stringInt = String(x)
            let halfCount = stringInt.count / 2
            let halfIndex = stringInt.index(stringInt.startIndex, offsetBy: halfCount)
            let endIndex =  stringInt.index(stringInt.startIndex, offsetBy: stringInt.count)
            let firstHalf = stringInt[..<halfIndex] // Hello
            let stringCount = stringInt.count
            var secondHalf = stringInt[halfIndex..<endIndex]
            let halfIndexPlusOne = stringInt.index(stringInt.startIndex, offsetBy: halfCount + 1)
            if stringCount % 2 == 1 {
                secondHalf = stringInt[halfIndexPlusOne..<endIndex]
            }
            
            let isPalindrome = true
            for i in 0..<firstHalf.count {
                let ascndingIndex = stringInt.index(stringInt.startIndex, offsetBy: i)
                let descendingIndex = stringInt.index(stringInt.startIndex, offsetBy: (stringInt.count - 1) - i)
                if stringInt[ascndingIndex] != stringInt[descendingIndex] {
                    return false
                }
            }
            return isPalindrome
        }
    }

}
