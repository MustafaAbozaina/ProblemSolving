//
//  3Sum.swift
//  ProblemSolvingTests
//
//  Created by mustafa salah eldin on 10/25/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

class ThreeSumTests: XCTestCase {
    
    func test() {
        let arr =  [-2, -1, 1, 2] //[-3,-2, -1, 0, 1, 2, 3]
        // expected = [-3, 0, 3] , [-2, 0, 2], [-1, 0, 1], [-2, -1, 3], [2,1, -3]
        //        [ 0, 1,  2, 3, 4, 5, 6]
        
        var mid = arr.count / 2
        var result = [[Int]]()
        var methodFinished = false
        for i in 0..<arr.count - 2 {
            var last = arr.count - 1
            mid = ((last - i) / 2) + i
            if methodFinished {
                break
            }
            while (  last > mid)  { // last != i + 1 &&
                let the3Elements = [arr[i], arr[mid] , arr[last]]
                if arr[i] >= 0 {
                    methodFinished = true
                }
                let sum = the3Elements.reduce (0, +)
                
                if sum == 0 {
                    result.append(the3Elements)
                    last -= 1
                    mid = ((last - i) / 2) + i
                }
                
                if sum > 0 {
                    if i + 1 == mid {
                        last -= 1
                        continue
                    }
                    mid -= 1
                }
                if sum < 0 {
                    mid += 1
                }
            }
        }
//        "[[-3, 0, 3], [-3, 1, 2],  [-2, 0, 2], [-1, -2, 3], [-1, -1, 2], ]"
        // [0, -3, 3], [-2, -1, 3],
        
        
//        "[[-3, 0, 3], [-3, 1, 2], [-2, -1, 3], [-2, 0, 2], [-1, 0, 1]]"
        XCTAssertEqual(result, [[1,2]])
    }
    
    func threeSumOptimized(arr: [Int]) {
            
        // need three indicators first last and middle
        // if the sum > 0 decrease the middle
        // if the sum < 0 increase the middle
        // if the sum == 0 || should change the location of the last element (decrease) and increase the middle one
        
        // Can I depend on last increased one like If check if last increased one was middle so It should be the last
            // [-2, -1, 1, 2, 3]
        // [-3,-2, -1, 1, 2, 3, 4, 5] // when the first value is getting smaller so that means the we should go out or decrease the positive number
        
        // output rule: decrease the middle till It comes to the index of the smallest number
        // increase
        // good move: if sum > 0 decrease middle
        let arr = [-3,-2, -1, 0, 1, 2, 3]

        var result = [[Int]]()
        for i in 0..<arr.count {
            var last = 0
            var middle = 0
            
            while (last > middle) {
                let sum = arr[i] + arr[middle] + arr[last]
                if  sum == 0 {
                    result.append([arr[i], arr[middle], arr[last]])
                    last -= 1
                    middle += 1
                    break
                }
                if sum > 0 {
                    
                }
                    
            }
        }
    }
    
    func test_3Sum() {
        // I should use one indicator fixed at an entire loop
        // Should satisfy fixed index less than -2
        // should satisfy
        // if i >= 0 { break }
        
        // How to ensure that elemnts walkthrough
        //
        // [-2,-1, 0, 1, 2, 3] // what I'm looking for is walking through all elements or using special equation to neglect the unneeded ones
        // [-2, -1,0] [-2, -1,1 ] [ -2, -1, 2]
        // [-2, 0, 1] [-2, 1, 2]
        // []
        // the equation if sum > 0 minues middle index
        // "[[-3, 0, 3], [-3, 1, 2], [-2, -1, 3], [-2, 0, 2], [-1, 0, 1]]"
        
        // for (
        // while (last != middle) {} //
        //
        
        let arr = [-3,-2, -1, 0, 1, 2, 3]
        var result = [[Int]]()
        var i = 0
        var lastIndex = arr.count - 1
        var middleIndex = arr.count - 2
        while (i < arr.count - 1) {
            let first = arr[i]
           
            var sum = first + arr[middleIndex] + arr[lastIndex]
            
            if first >= 0 {
                break
            }
            
            if sum == 0 {
                result.append([first, arr[middleIndex], arr[lastIndex]])
                i += 1
                lastIndex = arr.count - 1
                middleIndex = arr.count - 2
                continue
            }
            
            if sum > 0 {
//                if lastIndex - middleIndex > 1 {
//                    lastIndex -= 1
//                } else {
                    middleIndex -= 1
//                }
            }
            if sum < 0 {
                i += 1
                lastIndex = arr.count - 1
                middleIndex = arr.count - 2
                continue
            }
        }
        
        XCTAssertEqual(result,[ [1,2]])
        XCTAssertEqual(threeSum1(arr: arr), [[1,2]])
    }
    
    func threeSum1(arr: [Int]) -> [[Int]] {
        var result = [[Int]]()
        for i in 0..<arr.count - 2 {
            for k in i+1..<arr.count - 1 {
            for j in k+1..<arr.count {
                if arr[i] + arr[k] + arr[j] == 0 {
                    result.append([arr[i], arr[k], arr[j]])
                }
            }
            }
        }
        return result
    }
}
