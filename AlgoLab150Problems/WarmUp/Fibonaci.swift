//
//  Fibonaci.swift
//  AlgoLab150Problems
//
//  Created by Mustafa Abozaina on 15/01/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//
//6. Fibonacci Number: https://leetcode.com/problems/fibonacci-number

import XCTest

final class Fibonaci: XCTestCase {
    
    func test() {
        XCTAssertEqual(fib(5), 50)
    }
    var dic = [Int: Int]()
        // This solution beats 100%
    func fib(_ n: Int) -> Int {
        // Dynamic programming
        if dic[n] != nil {
            return dic[n] ?? 0
        }
        if n == 0 {
            return 0
        }
        if n <= 2 {
            return 1
        }
        let result = fib(n-1) + fib(n-2)
        
    // Dynamic programming
        dic[n] = result
        return result
    }
    
}
