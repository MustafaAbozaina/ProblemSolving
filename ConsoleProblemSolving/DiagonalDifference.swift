//
//  DiagonalDifference.swift
//  ConsoleProblemSolving
//
//  Created by mustafa salah eldin on 2/11/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import Foundation

func findDiagonalDifference() -> Int {
    var matrix = [[Int]]()
//    matrix.append([11,2,4])
//    matrix.append([4,5,6])
//    matrix.append([10,8,-12])
    matrix = testData()
    var firstDiagonal = 0
    var secondDiagonal = 0
    for i in 0..<matrix.count {
        let rowCount = matrix[i].count
        firstDiagonal += matrix[i][i]
        secondDiagonal += matrix[i][(rowCount - 1 ) - i]
    }
    
    var result = firstDiagonal - secondDiagonal
    print(abs(result))
    return abs(result)
    
}

private func testData() -> [[Int]]{
    
    var matrix = [[Int]]()
    matrix.append([6,6,7,-10,9,-3,8,9,-1])
    matrix.append([9,7,-10,6,4,1,6,1,1])
    matrix.append([-1,-2,4,-6,1,-4,-6,3,9])
    matrix.append([-8,7,6,-1,-6,-6,6,-7,2])
    matrix.append([-10,-4,9,1,-7,8,-5,3,-5])
    matrix.append([-8,-3,-4,2,-3,7,-5,1,-5])
    matrix.append([-2,-7,-4,8,3,-1,8,2,3])
    matrix.append([-3,4,6,-7,-7,-8,-3,9,-6])
    matrix.append([-2,0,5,4,4,4,-3,3,0])
    return matrix
}
