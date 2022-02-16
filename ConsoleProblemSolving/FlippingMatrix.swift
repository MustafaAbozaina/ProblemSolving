//
//  FlippingMatrix.swift
//  ConsoleProblemSolving
//
//  Created by mustafa salah eldin on 2/13/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import Foundation

func flippingMatrix() {
    print("d \(sumOfUpperLeftCorner(matrix: matrix))")
    var upperLeftLength = matrix.count / 2
    var firstPart = 0
    var secondPart = 0
    for i in 0..<matrix.count {
        
        for j in 0..<matrix[i].count {
            if j >= matrix.count / 2 {
                secondPart += matrix[i][j]
            }else {
            firstPart += matrix[i][j]
            }
        }
        print("first \(firstPart)")
        print("second \(secondPart)")
        if secondPart > firstPart {
            let array = matrix[i].reversed()
            
            matrix[i] = Array(array)
        }
    }
    var firstColumnPart = 0
    var secondColumnPart = 0
    
    for i in 0..<matrix.count {
        for j in 0..<matrix.count {
            if (j < upperLeftLength) {
                firstColumnPart += matrix[j][i]
            }else {
                secondColumnPart += matrix[j][i]
            }
        }
        if secondColumnPart > firstColumnPart {
            matrix[i]
        }
    }
    print(matrix)
}

func sumOfUpperLeftCorner(matrix: [[Int]]) -> Int {
    // because it's 2n * 2n
    let upperMaxRowLength = matrix.count / 2
    let upperMaxColumnLength = matrix.count / 2
    
    var sum = 0
    
    for i in 0..<upperMaxRowLength {
        for j in 0..<upperMaxColumnLength {
            sum += matrix[i][j]
        }
    }
    
    return sum
}

var matrix = [[112, 42, 83, 119], [56, 125, 56, 49],
            [15, 78, 101, 43], [62, 98, 114,108]]

