//
//  Heaps.swift
//  Heaps
//
//  Created by mustafa salah eldin on 10/28/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

/// Binary tree is a complete binary tree this means that all levels of the tree are fully filled and if the last level is partially filled, It's filled from left to right
/// Binary Tree: data structure in which each node has at most two children,
/// How to know how the elements have already entered the tree, Imagin that they entered from arr one by one
///

class Heaps: XCTestCase {

    func test_heap() {
        // lets develop min heap
        // min heap means that the entry element should be compared to the other elements
        // In min heap if the entry node less than the node so we complete to find the first greater element of the entry node
        // When find the greater one so we make It as a child to the entry element and let the parent of It = OperationA
        
        // oops:
        // There are two branches
        // we should go for both children if we got bigger one
        // if we found that left is smaller we make operationA
        
        // steps
        // first we need build a tree (refernce next)
        //
        
        let tree = Tree<Int>()
        let root = TreeNode(value: 5)
        tree.insertMin(node: root, value: 10)
        
    }
    
    
    
}

class Tree<T: Equatable & Comparable> {
    var root: TreeNode<T>?
    
    func insertMin(node: TreeNode<T>?, value: T) {
        if let nodeValue = node?.value {
            if nodeValue > value {
                let aTreeNode = TreeNode(value: value)
                self.root = aTreeNode
            } else {
                insertMin(node: node?.next, value: value)
            }
        }
    }
    
    func print(_ node: TreeNode<T>) {
        Swift.print(node.value)
        
        print(node)
    }
}

class TreeNode<T: Equatable & Comparable> {
    var left: TreeNode?
    var right: TreeNode?
    var value: T
    
    init(value: T) {
        self.value = value
    }
}
