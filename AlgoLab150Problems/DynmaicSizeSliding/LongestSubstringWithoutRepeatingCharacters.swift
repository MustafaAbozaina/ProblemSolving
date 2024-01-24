//
//  LongestSubstringWithoutRepeatingCharacters.swift
//  AlgoLab150Problems
//
//  Created by Mustafa Abozaina on 21/02/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//

import XCTest

class LongestSubstringWithoutRepeatingCharactersTests: XCTestCase {
//    tmmzuxt
    func test() {
        XCTAssertEqual(lengthOfLongestSubstring("tmmzuxt") , 5)
    }
    
    // This is using dynamic size sliding window
    func lengthOfLongestSubstringRightAnswer(_ s: String) -> Int {
        let n = s.count
        var maxLength = 0
        var charMap = [Character: Int]()
        var left = 0
        var right = 0
        
        let characters = Array(s)
        
        while right < n {
            let currentChar = characters[right]
            
            // If the current character is already in the map, update the left pointer to the next position after the previous occurrence of the character
            if let index = charMap[currentChar] {
                left = max(left, index + 1)
            }
            
            // Update the maximum length if necessary
            maxLength = max(maxLength, right - left + 1)
            
            // Update the latest index of the current character in the map
            charMap[currentChar] = right
            
            right += 1
        }
        
        return maxLength
    }
    
    func lengthOfLongestSubstring(_ s: String) -> Int {
        // lenghth of logest substring without repeating
        // we need to know if a substring repeated
        // we need to get the longest one
        
        // loop through elements
        // add every character in dictionary
        // the first character we find exist in the dictionary we should create new one
        
        var longestSubstring = 0
        var tempLength = 0
        var charSet = Set<Character>()
        var charDic = [Character: Int]()
        let characters = Array(s)
        let sArray = Array(s)
        for i in 0..<sArray.count {
            let character = sArray[i]
            if charDic[character] != nil {
                tempLength = i - (charDic[character] ?? 0)
                charDic[character] = i
//                if i == sArray.count - 1 {
//                    tempLength -= 1
//                }
            } else {
                charDic[character] = i
                tempLength += 1
            }
            if tempLength > longestSubstring {
                longestSubstring = tempLength
            }
        }
        return longestSubstring
    }
    
    //    func lengthOfLongestSubstring(_ s: String) -> Int {
    //           // lenghth of logest substring without repeating
    //           // we need to know if a substring repeated
    //           // we need to get the longest one
    //
    //           // loop through elements
    //           // add every character in dictionary
    //           // the first character we find exist in the dictionary we should create new one
    //
    //           var longestSubstring = 0
    //           var tempLength = 0
    //           var charSet = Set<Character>()
    //           var characters = Array(s)
    //
    //           for character in s {
    //               if charSet.contains(character) {
    //                   // charSet.remove(character)
    //                   // charSet.insert(character)
    //                   // tempLength = tempLength - 1
    //                   charSet.removeAll()
    //                   charSet.insert(character)
    //                   tempLength = 1
    //                   continue
    //               } else {
    //                   charSet.insert(character)
    //                   tempLength += 1
    //               }
    //               if tempLength > longestSubstring {
    //                   longestSubstring = tempLength
    //               }
    //           }
    //           return longestSubstring
    //       }
}
