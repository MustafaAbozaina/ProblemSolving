//
//  ClosuresTests.swift
//  SwiftProblemsTests
//
//  Created by Mustafa Abozaina on 23/01/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//

import XCTest

final class ClosuresTests: XCTestCase {
    var numberOfLengthCalled = 0
    func test_trailingColsure() {
        let arr = [1, 2, 3, 4, 5, 6]
        let evenList = filterList(list: arr, where: {$0 % 2 == 0 })
        let oddList = filterList(list: arr, where: {$0 % 2 == 1})
        XCTAssertEqual(evenList, [2, 4, 6])
        XCTAssertEqual(oddList, [1, 3, 5 ])
    }
    
    func test_capturingValues() {
        var value = 4
        let closure = {
            return value + 1
        }
        
        value = 9
        let result = closure()
        XCTAssertEqual(result, 10)
    }
    
    func test_singleExpressionClosure() {
        let numbers = [1, 5, 10, 20, 30]
        // Here we can use return or Not
        let filteredNumbers = numbers.filter( { return $0 > 5 } )
        XCTAssertEqual(filteredNumbers, [10, 20, 30])
    }
    
    func test_capturingValuesWithEscaping() {
        let value = 4
//        let clsoure = @escaping {
//
//        }
    }
//    let localClosure: () -> Int = { value
//        return
//    }
   
    func test_questions() {
        XCTAssertEqual(filterEvenNumbers(numbers: [1,2,3,4,5,6]), [2,4,6])
        XCTAssertEqual(mapSquareRoot(numbers: [1,2,3,4,5]), [1,4,9,16,25])
        XCTAssertEqual(filterAndMap(numbers: [1,2,3,4,5,6]), [4,16,36])
        let exp = expectation(description: "expect the closure to be fired ")
        let delayTime = 2
        delay(delayTime) {
            exp.fulfill()
        }
        waitForExpectations(timeout: TimeInterval(delayTime))
        
        // Why using return closure is Useful
        XCTAssertEqual(getLength("hello")(), 5)
        XCTAssertEqual(numberOfLengthCalled, 1)
        XCTAssertEqual(getLength("hello")(), 5)
        XCTAssertEqual(numberOfLengthCalled, 2)
        XCTAssertEqual(getLength("hello")(), 5)
        XCTAssertEqual(numberOfLengthCalled, 3)
        
    }
 
}

//MARK: Questions in Closurs

extension ClosuresTests {
    //Filter even numbers: Write a function that takes an array of integers and returns a new array containing only the even numbers.
    func filterEvenNumbers(numbers: [Int]) -> [Int] {
        return numbers.filter { value in
            return value % 2 == 0
        }
    }
    
//    Map square root: Write a function that takes an array of integers and returns a new array containing the square root of each element.
    func mapSquareRoot(numbers: [Int]) -> [Int] {
        return numbers.map({$0 * $0})
    }
    
//    Filter and map in one pass: Write a function that takes an array of integers, filters out the even numbers, and maps the remaining numbers to their square roots.
    func filterAndMap(numbers: [Int]) -> [Int] {
        return numbers.filter({$0 % 2 == 0}).map({$0 * $0})
    }
    
//    Escaping closure: Write a function that takes an escaping closure and calls it after 2 seconds.
    func delay(_ delay:Int , closure: @escaping ()->()) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime(uptimeNanoseconds: UInt64(delay)) , execute: {
            closure()
        })
    }
    
//    Return Closure: Write a function that takes a string and return a closure, which will return the length of the given string.
    func getLength(_ input: String) -> (() -> Int) {
        return { [weak self] in
            self?.numberOfLengthCalled += 1
            return input.count
        }
    }
    
}

extension ClosuresTests {
    fileprivate func filterList<T>(list: [T], where condition: (T) -> Bool) -> [T] {
        var newList = [T]()
        for element in list {
            if condition(element) {
                newList.append(element)
            }
        }
        
        return newList
    }
}
