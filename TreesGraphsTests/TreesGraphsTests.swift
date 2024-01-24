//
//  TreesGraphsTests.swift
//  TreesGraphsTests
//
//  Created by mustafa salah eldin on 7/2/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

class TreesGraphsTests: XCTestCase {

    func test_doIt() {
//        let start = DispatchTime.now() // <<<<<<<<<< Start time
        let tree = NumbersTree(targetStairSteps: 4)

        let node1 = tree.findProb(node: TreeNode(data: 1, currentValue: 0))
        let node2 = tree.findProb(node: TreeNode(data: 2, currentValue: 0))
        let node3 = tree.findProb(node: TreeNode(data: 3, currentValue: 0))
        
        
       
//
//        let end = DispatchTime.now()   // <<<<<<<<<<   end time
//
//        let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
//        let timeInterval = Double(nanoTime) / 1_000_000_000 // Technically could overflow for long running tests

//        print("seconds without dynamic \(timeInterval)")
        print("probabilities \(tree.probabilitiesNumber)")
    }

}

fileprivate class NumbersTree {
    var stairSteps: Int = 0
    var probabilitiesNumber = 0
    var savedPaths = [Int: TreeNode<Int>]()
    
    init(targetStairSteps: Int) {
        self.stairSteps = targetStairSteps
    }
    
    func findProb(node: TreeNode<Int> ) -> TreeNode<Int>? {
        let currentNode = node
        currentNode.currentValue = node.data + node.currentValue
        if let savedNode = savedPaths[currentNode.currentValue] {
            probabilitiesNumber += savedNode.probabilities
            return savedNode
        }
        if currentNode.currentValue > stairSteps {
            return nil
        }else if currentNode.currentValue == stairSteps {
            probabilitiesNumber += 1
            currentNode.probabilities += 1
            return currentNode
        }
        
        let node1 = findProb(node: TreeNode(data: 1, currentValue: node.currentValue))
        let node2 = findProb(node: TreeNode(data: 2, currentValue: node.currentValue))
        let node3 = findProb(node: TreeNode(data: 3, currentValue: node.currentValue))
        
        
        let finalNode = node
        finalNode.adjacencyList = []
        if let node1 = node1 {
            finalNode.adjacencyList?.append(node1)
        }
        if let node2 = node2 {
            finalNode.adjacencyList?.append(node2)
        }
        if let node3 = node3 {
            finalNode.adjacencyList?.append(node3)
        }
        for n in finalNode.adjacencyList ?? [] {
            if (n.adjacencyList?.count ?? 0) > 1 {
                finalNode.probabilities += n.adjacencyList?.count ?? 0
            }
        }
        savedPaths[currentNode.currentValue] = finalNode
        return finalNode
        
    }
}

fileprivate class TreeNode<T> {
    var adjacencyList: [TreeNode]?
    var probabilities = 0
    var data:T
    var currentValue: T
    
    init(data: T,currentValue: T) {
        self.data = data
        self.currentValue = currentValue
    }
    
}
