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


var nodesPath = ""
fileprivate class Node {
    var left: Node?
    var right: Node?
    var data: Int
    
    init(data: Int) {
        self.data = data
    }
    
    func insert(value: Int) {
        if value <= self.data {
            if let leftNode = self.left {
                leftNode.insert(value: value)
            }else {
                self.left = Node(data: value)
            }
            
            
        }else {
            if let rightNode = self.right {
                rightNode.insert(value: value)
            }else {
                self.right = Node(data: value)
            }
        }
    }
    
    func contains(value: Int) -> Bool {
        if data == value {
            return true
        }
        if  let _ = left, data > value  {
            return left?.contains(value: value) ?? false
        }else
        if let _ = right, data < value {
            return right?.contains(value: value) ?? false
        }
        return false
    }
    
    func printInOrder() {
        left?.printInOrder()
        nodesPath += "\(data)"
        print(data,terminator: " ")
        right?.printInOrder()

    }
    
    func printPreOrder() {
        nodesPath += "\(data)"
        print(data,terminator: " ")
        left?.printPreOrder()
        right?.printPreOrder()
    }
    
    func printPostOrder() {
        left?.printPostOrder()
        right?.printPostOrder()
        nodesPath += "\(data)"
        print(data,terminator: " ")
        
    }
}

class Tree {
    fileprivate var rootNode: Node?
    fileprivate func addNode(values: [Int]) -> Node{
       
        for value in values {
            if let _ = rootNode {
                rootNode?.insert(value: value)
            } else {
                rootNode = Node(data: values[0])
            }
        }
        return rootNode ?? Node(data: 0)
    }
}

