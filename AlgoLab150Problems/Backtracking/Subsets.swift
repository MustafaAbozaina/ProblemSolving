//
//  Subsets.swift
//  AlgoLab150Problems
//
//  Created by Mustafa Abozaina on 21/05/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//
// https://leetcode.com/problems/subsets

import XCTest

final class SubsetsTests: XCTestCase {
    var result = [[Int]]()
    func test() {
        let input = [1,2,3]
        let expectedResult = [[],[1],[2],[1,2],[3],[1,3],[2,3],[1,2,3]]
        XCTAssertEqual(expectedResult, subsets(input))
    }
    
    func subsets(_ nums: [Int]) -> [[Int]] {
        var result: [[Int]] = []
        backtrack([], 0, nums, &result)
        return result
    }

    func backtrack(_ currentSet: [Int], _ index: Int, _ nums: [Int], _ result: inout [[Int]]) {
        result.append(currentSet)
        
        for i in index..<nums.count {
            var updatedSet = currentSet
            updatedSet.append(nums[i])
            backtrack(updatedSet, i + 1, nums, &result)
        }
    }
    
    //When tried to solve at the begining
    func wrongeSubsets(_ nums: [Int]) -> [[Int]] {
            // Save selected subset in a set
            // We can compare with It

            // we have empty state
            // each individual element state (separate loop)
            // for each one element we should have an array of other elements:-
                // like we have pivot 1 and then add array of 2 and then added to output
                // -> then loop again and add 3 to the array and add [1,2,3] to the output. Until you finish

            // I think we should start from begining to end. i.e. if we at 2 we don't to loop on previous elements because by this we will repeat or duplicate outputs

            // we have empty state
            var output = [[Int]]()
            output.append([])

            // each individual element state (separate loop)
            for i in 0..<nums.count {
                let element = nums[i]
                output.append([element])
                var tempArr = [Int]()
                tempArr.append(element)
                for j in i+1..<nums.count {
                    tempArr.append(nums[j])
                    output.append(tempArr)
                }
                var outputSet = Set(output)
                for k in i+1..<nums.count {
                    tempArr = [element]
                    tempArr.append(nums[k])
                    if outputSet.contains(tempArr) {
                        continue
                    }
                    output.append(tempArr)
                }

                outputSet = Set(output)
                for k in i+1..<nums.count {
                    
                }

            }
        return output
        }
}
