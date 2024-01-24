
//
//  Pixidia.swift
//  InterviewTests
//
//  Created by Mustafa Abozaina on 01/02/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//

import XCTest


class PixidiaTests: XCTestCase {
    
    func test() {
        
        
        XCTAssertEqual(result, expected)
    }
    
    func calculate() {
        var allElementsDic = [Int: Bool]()
        var calculatedDic = [Int: Bool]()
        var countOfRepeated = 0
        let arr = [1, 2, 3, 4, 5, 6, 7, 8]
        var result = [Int]()
        var newOrderedWithDuplicates = [Int]()
        for element in arr {
            if allElementsDic[element] == nil {
                allElementsDic[element] = true
                newOrderedWithDuplicates.append(element)
            } else {
                if calculatedDic[element] == nil {
                    countOfRepeated += 1
                    calculatedDic[element] = true
                }
            }
        }
        result.append(countOfRepeated)
        let duplicatesArray = calculatedDic.keys.sorted()
        result.append(duplicatesArray.first ?? 0)
        
        if duplicatesArray.count <= 1 {
            result.append(0)
        } else {
            result.append(duplicatesArray.last ?? 0)
        }
        
        result.append(contentsOf: newOrderedWithDuplicates)
    }
}
