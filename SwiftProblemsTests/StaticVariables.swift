//
//  StaticVariables.swift
//  SwiftProblemsTests
//
//  Created by Mustafa Abozaina on 22/01/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//

import XCTest

class StaticVariablesTests: XCTestCase {
    
    func test() {
        var marks = Player(stmark: student2()) // Result protocol
        var marksec = student() // ClassA protocol

        marks.print(target: marksec) // result print classA
        marks.print(target: marksec)
        marks.print(target: marksec) // no1 7
        marks.stmark = ClassB()
        marks.print(target: marksec) // 2
        marks.print(target: marksec) // - 3
        marks.print(target: marksec) // - 8
//        When we run the above program what wil lbe the out put?

    }
    
    func test_liveTimeOfStaticVariables() {
        var myClass: MyClass? = MyClass()
        myClass?.instanceData = -1
        XCTAssertEqual(myClass!.instanceData, -1)
//        myClass = nil
        let valueOfStatic = 10
        MyClass.sharedData = valueOfStatic
        trackMemoryLeak(instance: myClass!)
        addTeardownBlock { [weak myClass] in
            XCTAssertNil(myClass)
            XCTAssertEqual(MyClass.sharedData, valueOfStatic)
        }
    }
    
}


class MyClass {
    static var sharedData = 5
    var instanceData = 0
}
