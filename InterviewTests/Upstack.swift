//
//  InterviewTests.swift
//  InterviewTests
//
//  Created by mustafa salah eldin on 11/17/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

class CodeByteCouldDevsTests: XCTestCase {

    func test_swiftProblem() {
        var input = [[Int]]()
        let string = "4 1 2 3".components(separatedBy: " ")
        let numbersArray = string.map({Int($0)})
        let sortedArray = numbersArray.sorted {$0 ?? 0 < $1 ?? 0}
        XCTAssertEqual(sortedArray, [1])
    }

}

