//
//  SquadioTests.swift
//  GraphsTests
//
//  Created by mustafa salah eldin on 7/5/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

//                if s[i] == s[i+1] {
//                    s[i] = s[i+2]
//                    s[i+2] = temp
//                }else {

// loop from i to s.count
// if condition is true continue
// if condition is false just swap one
//                }
//        XCTAssertTrue(isValidCondition(i: i, s: &s))

class SquadioTests: XCTestCase {
    
    func test_swaps() {
//        var i = 0
        var s = Array("1010")
        var swapsNumber = 0
        let n = s.count

        for i in 0..<n - 1 {
            if !isValidCondition(i: i, s: &s) {
                let temp = s[i]

                    s[i] = s[i+1]
                    s[i+1] = temp
                if !(s[i] == s[i+1]) {
                    swapsNumber += 1
                }
            }
        }
        XCTAssertEqual(String(s), "0110")
        XCTAssertEqual(swapsNumber, 1)

    }
    
    func isValidCondition(i: Int, s: inout Array<String.Element>) -> Bool {
        let nCount = (s.count / 2)
        let result1 =  ((i+1) % nCount) - (i % nCount)
        if  result1 == 1 {
            let output1 = Int(String(s[i + 1]))! + Int(String(s[i]))!
            var output2 = 1
            if i + nCount < nCount * nCount {
            output2 = Int(String(s[i+nCount]))! + Int(String(s[i]))!
            }
            if output1 == 1 && output2 == 1 {
                return true
            } else {
                return false
            }
        } else
        { return true }
    }
    
}


extension String {

    var length: Int {
        return count
    }

    subscript (i: Int) -> String {
        return self[i ..< i + 1]
    }

    func substring(fromIndex: Int) -> String {
        return self[min(fromIndex, length) ..< length]
    }

    func substring(toIndex: Int) -> String {
        return self[0 ..< max(0, toIndex)]
    }

    subscript (r: Range<Int>) -> String {
        let range = Range(uncheckedBounds: (lower: max(0, min(length, r.lowerBound)),
                                            upper: min(length, max(0, r.upperBound))))
        let start = index(startIndex, offsetBy: range.lowerBound)
        let end = index(start, offsetBy: range.upperBound - range.lowerBound)
        return String(self[start ..< end])
    }
}
