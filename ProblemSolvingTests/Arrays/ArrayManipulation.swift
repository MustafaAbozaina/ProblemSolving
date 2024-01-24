//
//  ArrayManipulation.swift
//  ProblemSolvingTests
//
//  Created by mustafa salah eldin on 6/14/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest


class ArrayManipulation: XCTestCase {

    func test_arrayManipulation() {
        //1- we have 1 index array of zeros [0,0,0]
        //2- list of operation
        //3- for each operation, Add a value (sum) between two indices in zeros array // insert
        //4- target: after all operations done => operationsArray loop ended //
        // return the maximum value in the index array
        
        // problem with one indexed that element 0 should be in index 1
        // so element in index should be in the index after it
        // the problem with last index so we can increase zeros array by 1
        
        //1-
        let n = 10
        var zerosArray = [Int](repeating: 0, count: n)
        zerosArray.append(0)
        //2-
        let queries = [[1,5,3], [4,8,7], [6,9,1]]
        //3-
        
        for i in 0..<queries.count {
            zerosArray[queries[i][0]]
        }
        
        for query in queries {
            for i in query[0]...query[1] { // time exceed
                zerosArray[i] += query[2]
            }
        }
        debugPrint(zerosArray)
        XCTAssertEqual(zerosArray.max(), 10)
        
        // The problem is the complexity is nlogn
        //
        
        //1- first we will loop through queries array
        //2- find the common
        
        
        // overall cost = nLog(n)
        // convertItToLogn // could be constant * n
    }
    
    private func insert(values: [Int], startIndex: Int, endIndex: Int) {
        
    }



}
