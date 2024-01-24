//
//  DynamicProgramming.swift
//  ProblemSolvingTests
//
//  Created by mustafa salah eldin on 6/29/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

class DynamicProgramming: XCTestCase {
    
    //DP: Dynamic Programming
    func test_fibonacci_withoutDP() {
        var memo = [Int64: Int64]()
//        calculateTime(n: 5, runfunc: fib)
//        let start = DispatchTime.now() // <<<<<<<<<< Start time
        
       
        let number = fib(n: 40, memo: &memo)
        
//        let end = DispatchTime.now()   // <<<<<<<<<<   end time
//
//        let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
//        let timeInterval = Double(nanoTime) / 1_000_000_000 // Technically could overflow for long running tests
//
//        print("seconds without dynamic \(timeInterval)")
        
        XCTAssertEqual(number, 0)
    }
    
    func fib(n: Int64) -> Int64 {
        if n == 1 || n == 2 {
            return 1
        }
        let result = fib(n: n - 1) + fib(n: n - 2)
        return result
    }
    
    func fib(n: Int64, memo:inout [Int64:Int64]) -> Int64 {
//        if let memoized = memo[n] {
//            return memoized
//        }
        if n == 1 || n == 2 {
            return 1
        }
        let result = fib(n: n - 1, memo: &memo) + fib(n: n - 2, memo: &memo)
        memo[n] = result
        return result
    }
    
//    func calculateTime(n: Int, runfunc: (_ n:Int) -> Int){
//        let start = DispatchTime.now() // <<<<<<<<<< Start time
//
//        print(runfunc(n))
//        let end = DispatchTime.now()   // <<<<<<<<<<   end time
//
//        let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
//        let timeInterval = Double(nanoTime) / 1_000_000_000 // Technically could overflow for long running tests
//
//        print("seconds without dynamic \(timeInterval)")
//
//    }

}
