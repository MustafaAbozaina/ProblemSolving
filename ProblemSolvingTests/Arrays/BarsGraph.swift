//
//  BarsGraph.swift
//  ProblemSolvingTests
//
//  Created by mustafa salah eldin on 4/5/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

class BarsGraph: XCTestCase {
    
    func test_bars() {
        XCTAssertEqual(largestAreaUnderneath(arr:[2, 1, 3, 4, 1]), 6)
        XCTAssertEqual(largestAreaUnderneath(arr:[6, 3, 1, 4, 12, 4]), 12)
        XCTAssertEqual(largestAreaUnderneath(arr:[5, 6, 7, 4, 1]), 16)
    }
    
    func largestAreaUnderneath(arr: [Int]) -> Int {
        var resultsArr = [Int]()
        var tempArr = [Int]()
        var singleRowResult = [Int]()
        for i in 0..<arr.count {
            tempArr.append(arr[i])
            for j in i+1..<arr.count {
                tempArr.append(arr[j])
                let min = tempArr.reduce(tempArr[0]){$0 < $1 ? $0 : $1}
                let result = tempArr.count * min
                singleRowResult.append(result)
            }
            resultsArr.append(singleRowResult.max() ?? 0)
            tempArr = []
            print("index \(i) -> \(resultsArr)")
            
        }
        return resultsArr.max() ?? 0
    }
    
   
    
    func isElementExist(element: String.Element, elements: Array<String.Element>) -> Bool {
        var exist = false
        elements.forEach { el in
            if el == element {
                exist = true
            }
        }
        return exist
    }
    
}
//
//Anagrams
//Two strings are anagrams if you can make one from the other by rearranging the letters.
//
//Write a function named is_anagram that takes two strings as its parameters. Your function should return True if the strings are anagrams, and False otherwise.
//
//For example, the call is_anagram("typhoon", "opython") should return True while the call is_anagram("Alice", "Bob") should return False.


