//
//  PlusMinus.swift
//  ConsoleProblemSolving
//
//  Created by mustafa salah eldin on 2/10/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import Foundation

func plusMinus() {
    let array = [-4, 3, -9, 0, 4, 1]
    var numbersDic = [String: [Int]]()
    var dicKey = "P"
    for element in array {
        if element > 0 {
            dicKey = "P"
            
        } else if element < 0 {
            dicKey = "N"
            
        }else {
            dicKey = "Z"
        }
        if(numbersDic[dicKey] == nil) {
            numbersDic[dicKey] = [Int]()
        }
        numbersDic[dicKey]?.append(element)
    }
    let positiveCount = (numbersDic["P"]?.count ?? 0)
    let negativeCount = (numbersDic["N"]?.count ?? 0)
    let zerosCount = (numbersDic["Z"]?.count ?? 0)
    let positivePercent = String(format: "%.6f", Double(positiveCount) / Double(array.count))
    let negativePercent = String(format: "%.6f", Double(negativeCount) / Double(array.count))
    let zerosPercent = String(format: "%.6f", Double(zerosCount) / Double(array.count))
    print(positivePercent)
    print(negativePercent)
    print(zerosPercent)
}
