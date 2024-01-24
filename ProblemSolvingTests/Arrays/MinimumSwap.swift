//
//  MinimumSwap.swift
//  ProblemSolvingTests
//
//  Created by mustafa salah eldin on 6/5/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest
class MinimumSwap: XCTestCase {
    
    
    func minimumSwap(arr1: [Int]) -> Int {
        var arr = arr1
        var numberOfSwaps = 0
        var isOrdered = false
        while !isOrdered {
        for i in 0..<arr.count {
            if i + 1 != arr[i] {
                arr.swapAt(i, arr[i] - 1)
                numberOfSwaps += 1
            }
    //            for j in i+1..<arr.count { // optimized
    //                if arr[j] == i+1 {
    //                    arr.swapAt(i, j)
    //                    numberOfSwaps += 1
    //                }
    //            }
    //        }
        }
            for i in 0..<arr.count - 1 {
                isOrdered = true
                if arr[i] > arr[i+1]{
                    isOrdered = false
                    break
                }
            }
        }
        return numberOfSwaps
    }

    
}
