//
//  FindTheMedian.swift
//  ConsoleProblemSolving
//
//  Created by mustafa salah eldin on 2/10/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import Foundation

func findLonlyNumberAmongRepeated() -> Int{
    let arr: [Int] = [1,2,3,4,3,2,1]
    var numbersDic = [String:Bool]()
    for number in arr {
        
        if ((numbersDic["\(number)"]) != nil) == true {
            numbersDic.removeValue(forKey: "\(number)")
        }else {
            (numbersDic["\(number)"]) = true
        }
    }
    let lonlyNumber = Int(numbersDic.keys.first ?? "0") ?? 0
    return lonlyNumber
}
