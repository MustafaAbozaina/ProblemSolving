//
//  LeftRotate.swift
//  ProblemSolvingTests
//
//  Created by mustafa salah eldin on 4/3/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

//https://www.hackerrank.com/challenges/ctci-array-left-rotation/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=arrays&h_r=next-challenge&h_v=zen

import XCTest

class LeftRotate: XCTestCase {

    func leftRotate(n: [Int], d: Int) -> [Int] {
        var modifiedArray = n
        for i in 0..<d {
            guard modifiedArray.count > 0 else {return []}
            let firstElement = modifiedArray[i] // O(1)
                modifiedArray.append(firstElement) // O(1)

        }
            modifiedArray = Array(modifiedArray[(d)...(modifiedArray.count - 1)])
        return modifiedArray
    }
    
    func test_leftRotation() {
        XCTAssertEqual([5,1,2,3,4], leftRotate(n: [1,2,3,4,5], d: 4))
    }
}
