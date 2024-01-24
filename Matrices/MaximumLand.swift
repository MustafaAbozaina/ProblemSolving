//
//  MaximumLand.swift
//  Matrices
//
//  Created by mustafa salah eldin on 12/9/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

class MaximumLandTests: XCTestCase {

    func test_maxLand() {
          let grid = [
            [0,0,1,0,0,0,0,1,0,0,0,0,0],
            [0,0,0,0,0,0,0,1,1,1,0,0,0],
            [0,1,1,0,1,0,0,0,0,0,0,0,0],
            [0,1,0,0,1,1,0,0,1,0,1,0,0],
            [0,1,0,0,1,1,0,0,1,1,1,0,0],
            [0,0,0,0,0,0,0,0,0,0,1,0,0],
            [0,0,0,0,0,0,0,1,1,1,0,0,0],
            [0,0,0,0,0,0,0,1,1,0,0,0,0]]
        
        let expectedResult = 6 // maximumLand
        
        XCTAssertEqual(maxAreaOfIsland(grid), expectedResult)
        
    }
    
    func maxAreaOfIsland(_ grid: [[Int]]) -> Int {
        // Adding a global variable
        // loop through the matrix

        // If I find a land make a recursion to check If there are connected lands
        // Add lands to visited to not loop through again

        // every land means that should return count +1

        // every return from connectedLands I check from Its count and this place should be in the matrices loop
        var maxSize = 0
        var visited = Set<String>()
        for r in 0..<grid.count {
            for c in 0..<grid[r].count {
                let landSize = getLand(grid: grid, row: r, col: c, visited: &visited)
                if landSize > maxSize {
                    maxSize = landSize
                }
            }
        }
        return maxSize
    }

    func getLand(grid: [[Int]], row: Int, col: Int, visited: inout Set<String>) -> Int {
        // if row at end return 0
        // if col at end return 0
        // if visited return 0

        // If grid[r][c] == 0 return 0
        // Else return 1
        if row < 0  || col < 0{
            return 0
        }
        if row >= grid.count || col >= grid[row].count {
            return 0
        }
        let positionPath = "\(row),\(col)"
        if grid[row][col] == 0  || visited.contains(positionPath) {
            return 0
        }
        var wholeLandValue = 1
        visited.insert(positionPath)

        let left = getLand(grid: grid, row: row - 1, col: col, visited: &visited)
        let right = getLand(grid: grid, row: row + 1, col: col, visited: &visited)
        let top = getLand(grid: grid, row: row, col: col - 1, visited: &visited)
        let bottom = getLand(grid: grid, row: row, col: col + 1, visited: &visited)

        wholeLandValue += left + right + top + bottom

        return wholeLandValue
    }

}
