//
//  Tree.swift
//  ConsoleProblemSolving
//
//  Created by mustafa salah eldin on 2/16/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import Foundation
var nodesPath = ""
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

