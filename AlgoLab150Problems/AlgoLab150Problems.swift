//
//  AlgoLab150Problems.swift
//  AlgoLab150Problems
//
//  Created by Mustafa Abozaina on 14/01/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//

import XCTest

final class AlgoLab150Problems: XCTestCase {

    func test() {
        
        
        XCTAssertEqual(processNumbers("5; 2; 5; 6; 1; 6; 7"), "")
    }
    
    func processNumbers(_ numbersStr: String) -> String {
        // Split the string into an array of integers
        let numbers = numbersStr.split(separator: ";").compactMap { Int($0.trimmingCharacters(in: .whitespaces)) }
        let n = numbers.count
        if n == 0 {
            return "0;0;0;"
        }
        // Create a dictionary to count the occurrences of each number
        var counts: [Int: Int] = [:]
        for num in numbers {
            counts[num, default: 0] += 1
        }
        // Find the duplicate numbers and their minimum and maximum values
        let duplicates = counts.filter { $0.value > 1 }.map { $0.key }
        let minDuplicate = duplicates.min() ?? 0
        let maxDuplicate = duplicates.max() ?? 0
        // Create a list of unique numbers in the original order
        var uniqueNumbers: [Int] = []
        for num in numbers {
            if !uniqueNumbers.contains(num) {
                uniqueNumbers.append(num)
            }
        }
        // Join the results into a string
        var results: [String] = []
        results.append(String(duplicates.count))
        results.append(String(minDuplicate))
        results.append(String(maxDuplicate))
        results.append(contentsOf: uniqueNumbers.map { String($0) })
        return results.joined(separator: ";") + ";"
    }
    
//
//    func calculate() {
//        var allElementsDic = [Int: Bool]()
//        var calculatedDic = [Int: Bool]()
//        var countOfRepeated = 0
//        let arr = [1, 2, 3, 4, 5, 6, 7, 8]
//        var result = [Int]()
//        var newOrderedWithDuplicates = [Int]()
//        for element in arr {
//            if allElementsDic[element] == nil {
//                allElementsDic[element] = true
//                newOrderedWithDuplicates.append(element)
//            } else {
//                if calculatedDic[element] == nil {
//                    countOfRepeated += 1
//                    calculatedDic[element] = true
//                }
//            }
//        }
//        result.append(countOfRepeated)
//        let duplicatesArray = calculatedDic.keys.sorted()
//        result.append(duplicatesArray.first ?? 0)
//
//        if duplicatesArray.count <= 1 {
//            result.append(0)
//        } else {
//            result.append(duplicatesArray.last ?? 0)
//        }
//
//        result.append(contentsOf: newOrderedWithDuplicates)
//
//        return result
//    }
}
