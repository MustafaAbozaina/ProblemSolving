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
        let root = tree.addNodes(values: given)
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
        let root = tree.addNodes(values: given)
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
        let root = tree.addNodes(values: given)
        root.printPostOrder()
        
        // then
        XCTAssertEqual(nodesPath, expected)
    }
    
    func test_containsData_shouldShouldReturnTrue() {
        // given
        let searchValue = 10
        let given =  [3,1,2,10,4,5,6,9,8,7]
        
        // when
        let tree = Tree()
        let root = tree.addNodes(values: given)
        
        // then
        XCTAssert(root.contains(value: searchValue))
    }
    
    func test_containsData_shouldReturnFalse() {
        // given
        let searchValue = 11
        let given =  [3,1,2,10,4,5,6,9,8,7]
        
        // when
        let tree = Tree()
        let root = tree.addNodes(values: given)
        
        // then
        XCTAssertFalse(root.contains(value: searchValue))
    }
    
    func test_getHeight_shouldSuccess() {
        let given =  [3,1,2,10,4,5,6,9,8,7,11,12,13,14,15,16,17] // 
        // when
        let tree = Tree()
        let rootNode = tree.addNodes(values: given)

        let treeHeight = tree.findHeight(node: rootNode)
        // then

        XCTAssertEqual(treeHeight, 8)
    }
    
    func test_findPath_shouldReturnPathFromRootToNode() {
        ///https://www.hackerrank.com/challenges/binary-search-tree-lowest-common-ancestor/problem?h_l=interview&playlist_slugs%5B%5D=interview-preparation-kit&playlist_slugs%5B%5D=trees
        let given =  [3,1,2,10,4,5,6,9,8,7]
//        let given = [5,6,9,8,4,2,3,1]
//        let given =  [4,2,3,1,7,6]
        let ancesstorShouldBe: Int = 6
        var lowestAncestor: Int = 0
        // when
        let tree = Tree()
        let root = tree.addNodes(values: given)
        let firstPath = root.findPath(value: 8)
        let secondPath = root.findPath(value: 9)
        for i in 1..<firstPath.count {
            if secondPath.contains(firstPath[i]){
                if firstPath[i] == secondPath[0] {
                    continue
                }
                print("the lowest ancestor is \(firstPath[i])")
                lowestAncestor = firstPath[i]
                break
            }
        }
       
        XCTAssertEqual(ancesstorShouldBe, lowestAncestor)
        
    }
    
    func test_isTreeAVL_shouldReturnTrueInCaseNotContainingRepeatedNumbers() {
        // if any repeated false else true
        // recursive find all right for each node making sure it's greater, conversely left
        // loop through all elements
        let given =  [4,7,9]
       
        // when
        let tree = Tree()
        let root = tree.addNodes(values: given)
        XCTAssert( root.isAVLTree(values: given))
    }
    
    func test_isTreeAVL_shouldReturnTrueIfLeftNodesLessThanParentsAndRightNodesGreaterThanParents() {
        let given =  [4,7,9,1,3,5,6]
       
        // when
        let tree = Tree()
        let root = tree.addNodes(values: given)
        XCTAssert( root.isAVLTree(values: given))
    }
    
    func test_isAVLTree_shouldReturnFalseInCaseRepeatedNumbersInserted() {
        let given =  [4,7,9,1,3,4,5,6]
       
        // when
        let tree = Tree()
        let root = tree.addNodes(values: given)
        XCTAssertFalse( root.isAVLTree(values: given))
    }
    
    func test_isBalancedTree_shouldReturnFalseIfRightOrLeftBranchesDifferenceMoreThan1() {
        let inputs = [ [3,1,2,10,4,5,6,9,8,7], [4,5,3,2,1,6,7,8,9]]
        for input in inputs {
            let tree = Tree()
            let root = tree.addNodes(values: input)
            
            XCTAssertFalse(tree.isBalanced(node: root))
        }
    }
    
    func test_isBalancedTree_shouldReturnTrueIfRightAndLeftBranchesDifferenceNoMoreThan1() {
        let inputs = [[5,1,2,3,4,6,7,8,9], [5,4,3,2,1,6,7,8,9]]
        for input in inputs {
            let tree = Tree()
            let root = tree.addNodes(values: input)
            
            XCTAssert(tree.isBalanced(node: root))
        }
    }
    
    func test_makingATreeBalanced_shouldIsBalancedReturnFalseFirstAndAfterProcessingTreeShouldReturnTrue() {
        let tree = Tree()
        var root: Node? = tree.addNodes(values: [3,1,2,10,4,5,6,9,8,7])
        root?.printPreOrder()
        let elements = root?.getData() ?? []
        XCTAssertFalse( tree.isBalanced(node: root))
        root = root?.balancingATree(elements: elements)
        XCTAssertTrue(tree.isBalanced(node: root))
        root?.printPreOrder()
        print("")
        root?.printInOrder()
        print("")
        root?.right?.printInOrder()
        print("")
        root?.left?.printInOrder()
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
    
    func balancingATree(elements: [Int]) -> Node? {
        //1- get all elements of this tree  -> done
        //2- take the array[mid] as the root
        //3- make recursive for any reset sub arrays till find no more than 1
//        var treeElements = elements
        let tree = Tree()
        var root: Node?
        if elements.isEmpty {
            return nil
        }
        if elements.count <= 2 {
             root = tree.addNodes(values: elements)
            return root
        }
        
        let parentIndex = elements.count / 2
        root = Node(data: elements[parentIndex])
        let leftNodes = balancingATree(elements: Array(elements[0..<parentIndex]))
        let rightNodes = balancingATree(elements: Array(elements[(parentIndex + 1)..<elements.count]))
        
        
        tree.rootNode = root
        tree.rootNode?.left = leftNodes
        tree.rootNode?.right = rightNodes
        
        
        return root
    }
    
    
    
    func isAVLTree(values: [Int]) -> Bool {
        let tree = Tree()
        let root = tree.addNodes(values: values)
        var set = Set<Int>()
        let s = root.findNodes(node: root, visited: &set)
        if (s == -1) {
            return false
        }else {
            return true
        }
    }
    
    func findNodes(node: Node?, visited: inout Set<Int>) -> Int {
        if node == nil {
            return 0
        }
        visited.insert(node!.data)
        var right: Bool = true
        var left: Bool = true
        if let rightNode = node?.right {
            if visited.contains(rightNode.data) {
                return -1
            }
            let nodeResult = findNodes(node: node?.right, visited: &visited)
            right = (nodeResult != -1) && nodeResult > (node?.data ?? 0)
        }
        if let leftNode = node?.left {
            if visited.contains(leftNode.data) {
                return -1
            }
            let nodeResult = findNodes(node: node?.left, visited: &visited)
            left = (nodeResult != -1) && nodeResult < (node?.data ?? 0)
        }
        
        if !right || !left {
            return -1
        }
        
        return (node?.data ?? 0)
        
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
    
    fileprivate func findPath(value: Int?) -> [Int] {
        if (data == value) {
            return [value!];
        }
        var rightPath = [Int]()
        var leftPath = [Int]()
        if let rightValue = right?.findPath(value: value) {
            rightPath.append(contentsOf: rightValue)
            rightPath.append(data)
        }
        if let leftValue = left?.findPath(value: value) {
            leftPath.append(contentsOf: leftValue)
            leftPath.append(data)
        }
        
        if (leftPath.contains(value!)) {
            return leftPath
        } else {
            return rightPath
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
    
    func getData() -> [Int]  {
        var arr = [Int]()
        arr.append(contentsOf: left?.getData() ?? [])
        arr.append(contentsOf: [data])
        arr.append(contentsOf: right?.getData() ?? [])
        
        return arr
    }
    
    
    func treeHeight() {
        
        
        
    }
    
    func balanceTree() {
        
    }
}

class Tree {
    fileprivate var rootNode: Node?
    fileprivate func addNodes(values: [Int]) -> Node{
       
        for value in values {
            if let _ = rootNode {
                rootNode?.insert(value: value)
            } else {
                rootNode = Node(data: values[0])
            }
        }
        return rootNode ?? Node(data: 0)
    }
//    let given =  [3,1,2,10,4,5,6,9,8,7]

    fileprivate func findHeight(node: Node? ) -> Int {
        if (node == nil) {
            return -1;
        }
        let righth = findHeight(node: node?.right)
        let lefth = findHeight(node: node?.left)
        
        if (lefth > righth) {
            return lefth + 1
        } else {
            return righth + 1
        }
    }
    
    fileprivate func isBalanced(node: Node?) -> Bool {
        // tree said to be balanced when each node's branches difference no more than 1 between left and right
        if branchesDifference(node: node) < -1 {
            return false
        }
        return true
    }
    
    fileprivate func branchesDifference(node: Node?) -> Int {
        if (node == nil) {
            return -1;
        }
        let righth = findHeight(node: node?.right)
        let lefth = findHeight(node: node?.left)
        
        // if the difference between 2 branches more than 1
        if abs(righth) - abs(lefth) > 1 {
            return -100
        }
        
        if (lefth > righth) {
            return lefth + 1
        } else {
            return righth + 1
        }
    }
    
}

