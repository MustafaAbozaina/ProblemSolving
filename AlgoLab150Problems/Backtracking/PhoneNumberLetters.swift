//
//  PhoneNumberLettersTests.swift
//  AlgoLab150Problems
//
//  Created by Mustafa Abozaina on 04/06/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//

import XCTest

// It needs more optimization: https://leetcode.com/problems/letter-combinations-of-a-phone-number
final class PhoneNumberLettersTests: XCTestCase {
    
    func test_sporty() {
        XCTAssertEqual(Set(letterCombinations("234")),  Set(["ad","ae","af","bd","be","bf","cd","ce","cf"]))
    }
    
    func letterCombinations(_ digits: String) -> [String] {
            // convert digits to array of characters (Numbers)
            // make function that retrieve Array(String) = characters for each number
            // after we have the list of strings we loop though each one and take the other ones
            // If string contains one character so we just retrieve Array(its String)
            // if string == "" return []
            if digits == "" {
                return []
            }
           var result = [String]()
            let numbers = digits.map({Int(String($0)) ?? 0})
            backtrack(currentString: "", fullStrings: getFullNumberStrings(numbers: numbers), index: 0, result: &result)
            
            return result
        }
        
        func getFullNumberStrings(numbers: [Int]) -> [String] {
            var strings: [String] = []
            for number in numbers {
                strings.append(getNumberString(number: number))
            }
            return strings
        }
        
        func getNumberString(number: Int) -> String {
            switch number {
            case 2:
                return "abc"
            case 3:
                return "def"
            case 4:
                return "ghi"
            case 5:
                return "jkl"
            case 6:
                return "mno"
            case 7:
                return "pqrs"
            case 8:
                return "tuv"
            case 9:
                return "wxyz"
            default:
                return ""
            }
        }
        // "ab" - "cd"
        func backtrack(currentString: String, fullStrings: [String], index: Int, result: inout [String]) {
            if currentString.count == fullStrings.count {
                result.append(currentString)
            }
            if fullStrings.count <= index {
                return
            }
            for i in 0..<fullStrings[index].count {
                var updateString = currentString
                updateString.append("\(Array(fullStrings[index])[i])")
                backtrack(currentString: updateString, fullStrings: fullStrings, index: index + 1, result: &result)
            }

        }
}
