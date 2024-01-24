//
//  File.swift
//  AlgoLab150Problems
//
//  Created by Mustafa Abozaina on 21/02/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//

import XCTest
// https://leetcode.com/problems/find-all-anagrams-in-a-string

// This if fixed sliding becuase we know that we need to move with a fixed size which equal the second array "abc" so It will be 3

class FindAllAnagramsInAStringTests: XCTestCase {
    func test() {
        let s = "cbaebabacd", p = "abc"
        XCTAssertEqual(findAnagrams(s, p), [0, 6])
    }
    // OptimizedOne
    func findAnagrams(_ s: String, _ p: String) -> [Int] {
        let k = p.count
        var pDict = [Character: Int]()
        let allCharacters = Array(s)
        var resultIndices = [Int]()
        resultIndices.reserveCapacity(allCharacters.count/p.count + 1)
        if allCharacters.count < p.count {
            return []
        }
        
        // we could refactor to high level function
        for character in p {
            if pDict[character] == nil {
                pDict[character] = 1
            } else {
                pDict[character]? += 1
            }
        }
        var comparedDict = [Character: Int]()
        // var shiftingArr = [Character]()
        for i in 0..<k {
            let stringElement = allCharacters[i]
            if comparedDict[stringElement] == nil {
                comparedDict[stringElement] = 1
            } else {
                comparedDict[stringElement]? += 1
            }
            // shiftingArr.append(allCharacters[i])
        }
        
        if pDict == comparedDict {
            resultIndices.append(0)
        }
        
        for i in k..<allCharacters.count {
            // comparedDict[s.getElementAt]
            if comparedDict[allCharacters[i-k]] == 1 {
                comparedDict[allCharacters[i-k]] = nil
            } else {
                comparedDict[allCharacters[i-k]]? -= 1
            }
            if comparedDict[allCharacters[i]] == nil {
                comparedDict[allCharacters[i]] = 1
            } else {
                comparedDict[allCharacters[i]]? += 1
            }
            if comparedDict == pDict {
                resultIndices.append(i-k+1)
            }
            // for j in 0..<k - 1 {
            //     shiftingArr[j] = shiftingArr[j+1]
            // }
            // shiftingArr[k - 1] = allCharacters[i]
            
            // if convertArrToDict(shiftingArr) == pDict {
            //     resultIndices.append(i-k+1)
            // }
        }
        
        return resultIndices
    }
    // Increases complexity without need of that
    //     private func convertArrToDict(_ arr: [String.Element]) -> [String.Element: Int]  {
    //         var dict = [String.Element: Int]()
    //         for element in arr {
    //             if dict[element] == nil {
    //                 dict[element] = 1
    //             }else {
    //                 dict[element]? += 1
    //             }
    
    //         }
    //         return dict
    //     }
    // }
    // O(N) <- so I deleted It
    // extension String {
    //      func getElementAt(_ index: Int) -> String.Element {
    //         let index = self.index(self.startIndex, offsetBy: index) // get the index of the 4th character
    //         return self[index]
    //     }
}
