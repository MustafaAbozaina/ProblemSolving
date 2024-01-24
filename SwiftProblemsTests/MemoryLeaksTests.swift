//
//  MemoryLeaksTests.swift
//  SwiftProblemsTests
//
//  Created by Mustafa Abozaina on 21/01/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//

import XCTest

class MemoryLeaksTests: XCTestCase {

    func test_leakBetweenTwoObjects() {
        let object1 = Person()
        let object2 = Person()
        
//        object1.brother = object2
//        object2.brother = object1 // This makes the cycle reference
        trackMemoryLeak(instance: object1, file: #file, line: #line)
    }
    
    func test_leakBetweenTwoStructs() {
//        var personValue2 = PersonValue()
        var personValue1: PersonValue? = PersonValue()
        personValue1?.brother = Person()

        addTeardownBlock {
            // stack free Its variables after the scope is end, and because It's a struct and Is scope didn't finished It should be not nil
            XCTAssertNotNil(personValue1)
        }
        
    }
    
    func test_connectionBetweenStructAndClass() {
        let classObject = Person()
        var structObject = PersonValue()
        
        classObject.valueRef = structObject
        structObject.brother = classObject
        
    }

}

// ask your self about who need to write an intializer for It
class Person {
    var brother: Person? = nil
    var valueRef: Any?
}

struct PersonValue {
    // var brother: PersonValue?
// Error: Value type 'PersonValue' cannot have a stored property that recursively contains it
    var brother: AnyObject?
//    init(brother: PersonValue? = nil) {
//        self.brother = brother
//    }
}

