//
//  LinkedListTests.swift
//  ProblemSolvingTests
//
//  Created by mustafa salah eldin on 6/28/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest


class TrainOnLinkedListTests: XCTestCase {
    
    func test() {
        print("hash is \(abs(2.hashValue) % 5)")
    }

    func test_linkedList() {
        let start = DispatchTime.now() // <<<<<<<<<< Start time

        let linked = MainLinkedList()
        let arr = [Int](0...10000000)
        
        for i in 0..<arr.count {
            let node = Node()
            node.data = i
            linked.insert(node: node)
        }
        
        linked.printAll()
        let end = DispatchTime.now()   // <<<<<<<<<<   end time

        let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds // <<<<< Difference in nano seconds (UInt64)
        let timeInterval = Double(nanoTime) / 1_000_000_000 // Technically could overflow for long running tests

        print("seconds \(timeInterval)")
        
    }

    
}


private class MainLinkedList {
    var head: Node?
    var tail: Node?
    
    func insert(node: Node) {
        if head == nil {
            head = node
            tail = node
        }else {
            tail?.next = node
            tail = node
        }
    }
    
    func printAll() {
//        print(node: head)
    }
    
    private func print(node: Node?) {
        guard let node = node, let _ = node.data else {return}
        debugPrint(node.data!)
        guard let next = node.next else {return}
        print(node: next)
    }
    // I need to calculate function running speed
    
}
private class Node {
    var next:Node?
    var data: Int?
}

