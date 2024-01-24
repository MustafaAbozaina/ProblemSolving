//
//  FizzBuzz.swift
//  AlgoLab150Problems
//
//  Created by Mustafa Abozaina on 16/02/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//

import XCTest

class FizzBuzzTests: XCTestCase {
    
    func fizzBuzz(_ n: Int) -> [String] {
        var resultArray = [String]()
        resultArray.reserveCapacity(n)
        for i in 1...n {
            // var word = "\(i)"
            // if i % 3 == 0 || i % 5 == 0 {
            //     word = ""
            // }
            var word = ""
            if i % 3 == 0 {
                word += "Fizz"
            }
            if i % 5 == 0 {
                word += "Buzz"
            }
            // OR If we could remove the first condition and add here
            if word == "" {
                word = "\(i)"
            }
            
            resultArray.append(word)
        }
        return resultArray
    }
    
    // OptimizedBecauseOfMakingAllElementsAtOnce, It differ of giving It a reserved Capacity
    func fizzBuzzOptimized(_ n: Int) -> [String] {
        // var resultArray = [String]()
        // resultArray.reserveCapacity(n)
        var resultArray = Array(repeating: "", count: n)
        for i in 0..<n {
            // var word = "\(i)"
            // if i % 3 == 0 || i % 5 == 0 {
            //     word = ""
            // }
            var word = ""
            if (i+1) % 3 == 0 {
                word += "Fizz"
            }
            if (i+1) % 5 == 0 {
                word += "Buzz"
            }
            // OR If we could remove the first condition and add here
            if word == "" {
                word = "\(i+1)"
            }
            
            resultArray[i] = (word)
        }
        return resultArray
    }
    
}
