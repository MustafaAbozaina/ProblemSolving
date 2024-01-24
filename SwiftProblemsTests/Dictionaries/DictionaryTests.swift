//
//  DictionaryTests.swift
//  SwiftProblemsTests
//
//  Created by Mustafa Abozaina on 23/01/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//

import XCTest

final class DictionaryTests: XCTestCase {
    
    func test() {
        
    }
    
    func test_equal() {
        let dict = ["a": 1, "C": 2]
        let dict2 = ["C": 2, "a": 1]
        
        XCTAssertEqual(dict, dict2)
        XCTAssertFalse( dict.elementsEqual(dict2, by: ==) ) // Because elementsEqual
    }
    
    func test_mapValues() {
        let dict = ["a": 1, "C": 2]
        // mapValues, It completley maps the value to another sort of values
        // dict.mapValues{$0 == 1} // <- this maps to dictionary of [String: Bool]
        let b = dict.mapValues{_ in "1"} // this maps to dictionary of [String: String]
        XCTAssertEqual(b, ["a": "1", "C": "1"])
    }
   

    func test_filter() {
        let dict = ["a": 1, "b": 3]
        let result = dict.filter {$0.value == 1}
        XCTAssertEqual(result, ["a": 1])
        XCTAssertNotEqual(result, ["b": 3])
    }
    
    func test_reduce() {
        let dict = ["Apples": 40, "Orange": 50, "Banana": 20]
        let sum = dict.reduce(0) {$0 + $1.value}
        
        XCTAssertEqual(sum, 110)
        
        // Find minimum maximum in Dictionary
        let ages = ["Alice": 25, "Bob": 30, "Charlie": 35]
        let maxAge = ages.values.reduce(Int.min, max)
        let minAge = ages.values.reduce(Int.min, max)
        print(maxAge) // 35
        print(minAge)
    }
    
    func countNumberOfOccurencies() {
        let ages = ["Alice": 25, "Bob": 30, "Charlie": 35, "David": 40]
        let ageGroups = ages.reduce(into: [Int: [String]]()) {
            let ageDecade = $1.value / 10
            if $0[ageDecade] == nil {
                $0[ageDecade] = []
            }
            $0[ageDecade]?.append($1.key)
        }
        print(ageGroups) // [2: ["Alice"], 3: ["Bob", "Charlie"], 4: ["David"]]
    }
    
    // Grouping values in a dictionary by a certain criteria
    func groupingValues() {
        let ages = ["Alice": 25, "Bob": 30, "Charlie": 35, "David": 40]
        let ageGroups = ages.reduce(into: [Int: [String]]()) {
            if $0[$1.value / 10] == nil {
                $0[$1.value / 10] = []
            }
            $0[$1.value / 10]?.append($1.key)
        }
        print(ageGroups) // [2: ["Alice"], 3: ["Bob", "Charlie"], 4: ["David"]]
    }
    
    func transformTheDictionaryIntoAnotherDictionar() {
        let ages = ["Alice": 25, "Bob": 30, "Charlie": 35]
        let agesInDecades = ages.reduce(into: [:]) { $0[$1.key] = $1.value / 10 }
        print(agesInDecades) // ["Alice": 2, "Bob": 3, "Charlie": 3]
    }
    
}
