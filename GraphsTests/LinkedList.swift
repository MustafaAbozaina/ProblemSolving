////
////  LinkedList.swift
////  GraphsTests
////
////  Created by mustafa salah eldin on 7/3/22.
////  Copyright © 2022 Mustafa Abozaina. All rights reserved.
////
//
//import Foundation
//
//class LinkedNode<T> {
//   var value: T
//   var next: LinkedNode?
//   weak var previous: LinkedNode?
//   
//    public init(value: T) {
//       self.value = value
//   }
//}
//
//public class LinkedList<T> {
//    
//    private var head: LinkedNode<T>?
//    
//    public var isEmpty: Bool {
//        return head == nil
//    }
//    
//    fileprivate var first: LinkedNode<T>? {
//        return head
//    }
//    
//    func isNotEmpty() -> Bool {
//        return head != nil
//    }
//    
//    fileprivate var last: LinkedNode<T>? {
//        guard var node = head else {
//            return nil
//        }
//        
//        while let next = node.next {
//            node = next
//        }
//        return node
//    }
//    
//    public func append(value: T) {
//        let newNode = LinkedNode(value: value)
//        if let lastNode = last {
//            newNode.previous = lastNode
//            lastNode.next = newNode
//        } else {
//            head = newNode
//        }
//    }
//    
//    // Counting the nodes
//    public var count: Int {
//        guard var node = head else {
//            return 0
//        }
//        
//        var count = 1 // count of the head
//        while let next = node.next {
//            node = next
//            count += 1
//        }
//        return count
//    }
//    
//    // Printing the contents of elements
//    public var print: String {
//       var s = "["
//       var node = head
//       while node != nil {
//           s += "\(node!.value)"
//           node = node!.next
//           if node != nil { s += ", " }
//       }
//       return s + "]"
//    }
//    
//    // Get Node at index -> O(n) // because it's loop through elements
//    func node(atIndex index: Int) -> LinkedNode<T> {
//        if index == 0 {
//            return head!
//        } else {
//            var node = head!.next
//            for _ in 1..<index {
//                node = node?.next
//                if node == nil { //(*1)
//                    break
//                }
//            }
//            return node!
//        }
//    }
//    
//    func insert(value: T, atIndex index: Int) {
//       let newNode = LinkedNode(value: value)
//       if index == 0 {
//           newNode.next = head
//           head?.previous = newNode
//           head = newNode
//       } else {
//           let previousNode = self.node(atIndex: index-1)
//           let nextNode = previousNode.next
//
//           newNode.previous = previousNode
//           newNode.next = nextNode
//           previousNode.next = newNode
//           nextNode?.previous = newNode
//       }
//    }
//    func remove(node: LinkedNode<T>) -> T {
//        let previousNode = node.previous
//        let nextNode = node.next
//
//        if let previousNode = previousNode {
//            previousNode.next = nextNode
//        } else {
//            head = nextNode
//        }
//        nextNode?.previous = previousNode
//
//        node.previous = nil
//        node.next = nil
//        return node.value
//    }
//    
//    func removeFirst() -> T {
//        return removeAt(0)
//    }
//    
//    @discardableResult
//    fileprivate func removeAt(_ index: Int) -> T {
//        let nodeToRemove = node(atIndex: index)
//        return remove(node: nodeToRemove)
//    }
//    
//}
