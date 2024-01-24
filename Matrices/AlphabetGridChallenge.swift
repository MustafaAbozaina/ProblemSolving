//
//  AlphabetGridChallenge.swift
//  Matrices
//
//  Created by mustafa salah eldin on 12/19/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

class AlphabetGridChallenge: XCTestCase {
    
    let alphabetDic: [String.Element: Int] = ["a":0, "b":1, "c":2 , "d":3, "e": 4, "f": 5, "g": 6, "h": 7, "i": 8, "j": 9, "k": 10, "l": 11, "m": 12, "n": 13, "o": 14, "p": 15, "q": 16, "r": 17, "s": 18, "t": 19, "u": 20, "v": 21, "w": 22, "x": 23, "y": 24, "z": 25]
    
    func gridChallenge(grid: [String]) -> String {
        // Check if rows in alphabetical order
        // How we can compare order -> we should separate the word into array of characters to compare them
        // we could make an array of complete alphabets and compare depending on It
        var charactersGrid = [[String.Element]]()
        var indicesOrder = [[Int]]()
        
        // O(n)
        for word in grid {
            charactersGrid.append(Array(word))
        }
        
        // O(n2)
        for i in 0..<charactersGrid.count {
            var elementIndices = [Int]()
            for j in 0..<charactersGrid[i].count {
                let char = charactersGrid[i][j]
                // let elIndex = (alphabet.index(of: char) ?? 0)
                let elIndex = alphabetDic[char] ?? 0
                elementIndices.append(elIndex)
            }
            elementIndices.sort()
            // let e = elementIndices.reduce(0, -)
            // indicesOrder.append(e)
            // var charactersArr = [String.Element]()
            // for index in elementIndices {
            //     charactersArr.append(alphabet[index])
            // }
            // charactersGrid[i] = charactersArr
            indicesOrder.append(elementIndices)
        }
        
        for c in 0..<(indicesOrder.first?.count ?? 0)  {
            for r in 0..<indicesOrder.count - 1{
                if indicesOrder[r][c] > indicesOrder[r+1][c] {
                    return "NO"
                }
            }
        }
        
        // Columns strings
        // for c in 0..<(charactersGrid.first?.count ?? 0) {
        //     var order = 0
        //     for r in 0..<charactersGrid.count {
        //         let elem = charactersGrid[r][c]
        //         let elIndex = alphabetDic[elem] ?? 0
        //         print("el index \(elIndex)")
        //         print("el character is \(elem)")
        //         if  elIndex < order  {
        //             return "NO"
        //         } else {
        //             order = elIndex
        //         }
        //     }
        
        // }
        //
        return "YES"
    }
}
