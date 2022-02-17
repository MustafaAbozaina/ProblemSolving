//
//  Tree.swift
//  ConsoleProblemSolving
//
//  Created by mustafa salah eldin on 2/16/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import Foundation

class Node {
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
    
    func printInOrder() {
        left?.printInOrder()
        print(data,terminator: " ")
        right?.printInOrder()

    }
    
    func printPreOrder() {
        print(data,terminator: " ")
        left?.printPreOrder()
        right?.printPreOrder()
    }
    
    func printPostOrder() {
        left?.printPostOrder()
        right?.printPostOrder()
        print(data,terminator: " ")
        
    }
}

class Tree {
    var rootNode: Node?
    func addNode(values: [Int]) -> Node{
       
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
