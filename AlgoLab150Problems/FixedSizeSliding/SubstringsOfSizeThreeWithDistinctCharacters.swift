//
//  File.swift
//  AlgoLab150Problems
//
//  Created by Mustafa Abozaina on 18/02/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//

import XCTest

class SubstringsOfSizeThreeWithDistinctCharactersTest: XCTestCase {
    func test() {
        let set = Set<Int>()
    }
    
    // Not Optimized
    func countGoodSubstrings(_ s: String) -> Int {
        //  we can divide the array into a list of 3 elments
        // if the Set become 2 so It means It has repeated character
        var setsArray = [Set<Character>]()
        let k = 3
        var tempArr = Array(repeating: Character("a"), count: k)
        var goodSubstrings = 0
        if s.count < k {
            return 0
        }
        for i in 0..<k {
            tempArr[i] = Array(s)[i]
        }
        setsArray.append(Set(tempArr))
        debugPrint(tempArr)
        for i in k..<s.count {
            // because order is not important
            // rotate array
            for i in 0..<k - 1{
                tempArr[i] = tempArr[i+1]
            }
            tempArr[k-1] = Array(s)[i]
            setsArray.append(Set(tempArr))
            debugPrint(tempArr)
            // debugPrint(setsArray)
        }
        
        for singleSet in setsArray {
            if singleSet.count == k {
                goodSubstrings += 1
                debugPrint("set is \(singleSet)")
            }
        }
        return goodSubstrings
    }
    
    // Optimized by removing array of sets and reserving constant capacity for Sets
    func countGoodSubstringsOptimized(_ s: String) -> Int {
        //  we can divide the array into a list of 3 elments
        // if the Set become 2 so It means It has repeated character
        var setsArray = [Set<Character>]()
        let k = 3
        var tempArr = Array(repeating: Character("-"), count: k)
        var goodSubstrings = 0
        var characters = Array(s)
        var lastSet = Set<Character>()
        lastSet.reserveCapacity(3) // this line Increased speed by 50% becuase we let Set has a fixed size
        if characters.count < k {
            return 0
        }
        for i in 0..<k {
            tempArr[i] = characters[i]
            lastSet = Set(tempArr)
        }
        if lastSet.count == k {
            goodSubstrings += 1
        }
        setsArray.append(Set(tempArr))
        debugPrint(tempArr)
        for i in k..<characters.count {
            // because order is not important
            // rotate array
            for i in 0..<k - 1{
                tempArr[i] = tempArr[i+1]
            }
            tempArr[k-1] = characters[i]
            lastSet = Set(tempArr)
            if lastSet.count == k {
                goodSubstrings += 1
            }
        }
        return goodSubstrings
    }
    
}
