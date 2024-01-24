//
//  Matrices.swift
//  Matrices
//
//  Created by mustafa salah eldin on 12/5/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

class Matrices: XCTestCase {
    
    func test_doIt() {
        let grid = [[0,1,0,0],[1,1,1,0],[0,1,0,0],[1,1,0,0]]
        XCTAssertEqual(islandPerimeter(grid), 16)
    }
    func islandPerimeter(_ grid: [[Int]]) -> Int {
            // should get the whole island land
            // note: we don't count number of islands
            //

            //getLand(grid: [[Int]], currentRow: Int, currentColumn: Int)
            /*
            inside square
            let number of removed borders = 0
            let left = row - 1
            let right = row + 1
            let top = col - 1
            let bottom = col + 1
            
            if left, right, top, bottom connected  {
                number += 1
            }
            
            */
        
        var number = 0
        var visited = Set<String>()
        for  i in 0..<grid.count { // row < grid.count && col < (grid.first?.count ?? 0) {
            for j in 0..<grid[i].count {
                getLand(grid: grid, row: i, col: j, visited: &visited, sum: &number)
            }
        }
        return number

            // know the connected squares and remove their inside borders from count
            // The rule is, If the square connected with next one in row or in column  so -1 border
        }
    @discardableResult
    func getLand(grid: [[Int]], row: Int, col:  Int, visited: inout Set<String>, sum: inout Int) -> Bool {
        var isExist = false
        if col == (grid.first?.count ?? -1) || col == -1 {
            return isExist
        }
        if row == grid.count || row == -1 {
            return isExist
        }
        
        if grid[row][col] == 0 {
            return isExist
        }
        
        let stringElementPosition = "\(row),\(col)"
        
        if visited.contains(stringElementPosition) {
            isExist = true
            return isExist
        }
        visited.insert(stringElementPosition)
        
        var numberOfRemovedBorders = 4
        let leftExist = getLand(grid: grid, row: row, col: col - 1, visited: &visited, sum: &sum)
        let rightExist = getLand(grid: grid, row: row, col: col + 1, visited: &visited, sum: &sum)
        let topExist = getLand(grid: grid, row: row - 1, col: col, visited: &visited, sum: &sum)
        let bottomExist = getLand(grid: grid, row: row + 1, col: col, visited: &visited, sum: &sum)
        isExist = true
        
        if leftExist {
            numberOfRemovedBorders -= 1
        }
        if rightExist {
            numberOfRemovedBorders -= 1
        }
        if topExist {
            numberOfRemovedBorders -= 1
        }
        if bottomExist {
            numberOfRemovedBorders -= 1
        }
        
        sum += numberOfRemovedBorders
        return isExist
    }
}
