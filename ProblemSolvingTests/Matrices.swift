//
//  Matrices.swift
//  ProblemSolvingTests
//
//  Created by mustafa salah eldin on 4/3/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

class Matrices: XCTestCase {
    
    //https://www.hackerrank.com/challenges/2d-array/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=arrays
    func test_2dMatrix() {
        let arr = [[0,-4,-6,0,-7,-6], [-1,-2,-6,-8,-3,-1], [-8,-4,-2,-8,-8,-6], [-3,-1,-2,-5,-7,-4], [-3,-5,-3,-6,-6,-6], [-3,-6,0,-8,-6,-7]]

        var highestHourGlassSum = -10000
        for i in 0..<arr.count - 2 {
            for j in 0..<arr[i].count - 2 {
                let topRow = [arr[i][j], arr[i][j+1], arr[i][j+2]]
                let middleRow = [arr[i+1][j+1]]
                let bottomRow = [arr[i+2][j], arr[i+2][j+1], arr[i+2][j+2]]
                let sumOfHourGlass = topRow.reduce(0, +) + middleRow.reduce(0,+) + bottomRow.reduce(0, +)
                if highestHourGlassSum < sumOfHourGlass {
                    highestHourGlassSum = sumOfHourGlass
                }
            }
        }
        XCTAssertEqual(highestHourGlassSum, -19)
    }
    
}


let arr = [[0,-4,-6,0,-7,-6], [-1,-2,-6,-8,-3,-1], [-8,-4,-2,-8,-8,-6], [-3,-1,-2,-5,-7,-4], [-3,-5,-3,-6,-6,-6], [-3,-6,0,-8,-6,-7]]







