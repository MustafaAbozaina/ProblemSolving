//
//  ValidAnagram.swift
//  AlgoLab150Problems
//
//  Created by Mustafa Abozaina on 15/01/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//

// 5. Valid Anagram: https://leetcode.com/problems/valid-anagram

import XCTest

final class ValidAnagram: XCTestCase {

    func test() {
        XCTAssertEqual(isAnagram("anagram", "ganaram"), true)
        XCTAssertEqual(isAnagram("anagram", "graham"), false)
    }
    
    func isAnagram(_ s: String, _ t: String) -> Bool {
            var sDic = [Character: Int]()
            var tDic = [Character: Int]()

            if s.count != t.count {
                return false
            }
            // need to know the repetition of every character
            // to know that, we need to make a dic with each repetition
            for char in s {
                if sDic[char] == nil {
                    sDic[char] = 1
                } else {
                    sDic[char]? += 1
                }
            }

            for char in t {
                if tDic[char] == nil {
                    tDic[char] = 1
                } else {
                    tDic[char]? += 1
                }
            }

            if sDic.keys != tDic.keys {
                return false
            }

            let isAnag = true
            for (key, value) in sDic {
                if tDic[key] == nil || tDic[key] != value  {
                    return false
                }
            }

            return isAnag
        }

}
