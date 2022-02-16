//
//  MinMaxSum.swift
//  ConsoleProblemSolving
//
//  Created by mustafa salah eldin on 2/10/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import Foundation

func minMaxSum() {
    let arr = [1,3,5,7,9]
    var max = arr[0]
    var min = arr[0]
    var maxIndex = 0
    var minIndex = 0
   
    for i in 0..<arr.count {
        if arr[i] > max {
            max = arr[i]
            maxIndex = i
        }else if arr[i] < min {
            min = arr[i]
            minIndex = i
        }
    }
    var maximumArrary = arr
    var minimumArray = arr
    maximumArrary.remove(at: minIndex)
    minimumArray.remove(at: maxIndex)
    let maximumNumbersSum = maximumArrary.reduce(0, +)
    let minimumNumbersSum = minimumArray.reduce(0, +)
    print("\(minimumNumbersSum) \(maximumNumbersSum)")    
}
