//
//  ProblemSolvingTests.swift
//  ProblemSolvingTests
//
//  Created by mustafa salah eldin on 2/17/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

class TreeTraversalTests: XCTestCase {


    func test_traverseInOrder_shouldSuccess() {
        // given
        let expected = "123456"
        let given = [1,2,4,5,6,3]
        nodesPath = ""
        
        // when
        let tree = Tree()
        let root = tree.addNode(values: given)
        root.printInOrder()
        
        // then
        XCTAssertEqual(nodesPath, expected)
    }
    
    func test_traversePreOrder_shouldSuccess() {
        // given
        let expected = "124356"
        let given = [1,2,4,5,6,3]
        nodesPath = ""
        
        // when
        let tree = Tree()
        let root = tree.addNode(values: given)
        root.printPreOrder()
        
        // then
        XCTAssertEqual(nodesPath, expected)
    }
    
    func test_traversePostOrder_shouldSuccess() {
        // given
        let expected = "216543"
        let given = [3,1,2,4,5,6]
        nodesPath = ""
        
        // when
        let tree = Tree()
        let root = tree.addNode(values: given)
        root.printPostOrder()
        
        // then
        XCTAssertEqual(nodesPath, expected)
    }

    func test_containsData_shouldSuccess() {
        // given
        let searchValue = 10
        let given =  [3,1,2,10,4,5,6,9,8,7]
        
        // when
        let tree = Tree()
        let root = tree.addNode(values: given)
        
        // then
        XCTAssert(root.contains(value: searchValue))
    }
    
    func test_containsData_shouldFailed() {
        // given
        let searchValue = 11
        let given =  [3,1,2,10,4,5,6,9,8,7]
        
        // when
        let tree = Tree()
        let root = tree.addNode(values: given)
        
        // then
        XCTAssertFalse(root.contains(value: searchValue))
    }
    
}
