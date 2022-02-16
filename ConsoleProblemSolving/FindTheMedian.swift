//
//  FindTheMedian.swift
//  ConsoleProblemSolving
//
//  Created by mustafa salah eldin on 2/14/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import Foundation


func findMedian(arr: [Int]) -> Int {
    // Write your code here
    let sortedArray = quickSort(array: arr)
    let medianIndex = sortedArray.count / 2
    let median = sortedArray[medianIndex]
    return median
}
