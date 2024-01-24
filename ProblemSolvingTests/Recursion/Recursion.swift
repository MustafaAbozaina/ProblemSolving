//
//  Recursion.swift
//  ProblemSolvingTests
//
//  Created by mustafa salah eldin on 6/29/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

class Recursion: XCTestCase {
    
    func test_getFactorial() {
        let factorial = getFactorial(number: 5)
        
        XCTAssertEqual(factorial, 120)
    }
    
    private func getFactorial(number: Int) -> Int {
        if number == 2 {
            return number
        }
        let result = number * getFactorial(number: number - 1)
        return result
        
    }
    
    func test_stairCases() {
        let n = 5
        var onesSteps: [Int] = []
        var allTwosArray: [Int] = []
        var twosSteps = [[Int]]()
        var threesSteps = [[Int]]()
        var threesTwosSteps = [[Int]]()
        // want to know how many ones
        for i in 0..<n {
            onesSteps.append(1)
        }
        for i in 0..<onesSteps.count - 1 {
            let arrPrefix = [Int](repeating: 1, count: (0..<i).count)
            let arrSuffix = [Int](repeating: 1, count: (i+2..<onesSteps.count).count)
            twosSteps.append(arrPrefix + [onesSteps[i]+onesSteps[i+1]] + arrSuffix)
        }
        for i in 0..<onesSteps.count - 2 {
            let arrPrefix = [Int](repeating: 1, count: (0..<i).count)
            let arrSuffix = [Int](repeating: 1, count: (i+3..<onesSteps.count).count)
            threesSteps.append(arrPrefix + [onesSteps[i]+onesSteps[i+1]+onesSteps[i+2]] + arrSuffix)
        }
        let remainder = n%2
        for i in 0..<n/2 {
            allTwosArray.append(2)
        }
        if remainder > 0 {
            allTwosArray.append(1)
        }
//        for i in 0..<allTwosArray.count {
//            let arrPrefix = [Int](repeating: 2, count: (0..<i).count)
//            let arrSuffix = [Int](repeating: 2, count: (i+2..<onesSteps.count).count)
//            threesTwosSteps.append(arrPrefix + [allTwosArray[i]+1] + [allTwosArray[i+1] - 1] + arrSuffix)
//        }
        XCTAssertEqual(onesSteps, [1,1,1])
        XCTAssertEqual(twosSteps, [[]])
        XCTAssertEqual(threesSteps, [[3]])
        
    }
    

}
