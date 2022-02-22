//
//  LinkedListTests.swift
//  ProblemSolvingTests
//
//  Created by mustafa salah eldin on 2/17/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

class LinkedListTests: XCTestCase {

    func test_appendingOneElement_shouldHeadAndTailNotNil() {
        let linkedList = LinkedList<Int>()
        linkedList.append(value: 5)
        XCTAssertNotNil(linkedList.first)
        XCTAssertNotNil(linkedList.last)
    }
    
    func test_appendingDifferentElements_shouldGiveCorrectCount() {
        let linkedList = makeIntSUT()
        let elements = [1,3,4,5,6,20,30]
        
        elements.forEach { e  in
            linkedList.append(value: e)
        }
        
        XCTAssertEqual(linkedList.count, elements.count)
    }
    
    func test_printingLinkedListElements_shouldSuccess() {
        let linkedList = makeIntSUT()
        let elements = [1,3,4,5,6,20,30]
        var expectedPrintedLinkedList = "["
        elements.forEach { e  in
            linkedList.append(value: e)
            if e == elements.last {
                expectedPrintedLinkedList += "\(e)"
            } else {
                expectedPrintedLinkedList += "\(e), "
            }
        }
        expectedPrintedLinkedList += "]"
        XCTAssertEqual(expectedPrintedLinkedList, linkedList.print)
    }
    
    func test_getNodeAtIndex_shouldRetrieveNoInsertedInStepsNumber() {
        let linkedList = makeIntSUT()
        let elements = [1,3,4,5,6,20,30]
        elements.forEach { e  in
            linkedList.append(value: e)
        }
        let the6ThNode = linkedList.node(atIndex: 6)
        
        XCTAssertEqual(the6ThNode.value, elements[6])
    }
    
    func test_insertElementAtIndex_shouldSuccess() {
        let linkedList = makeIntSUT()
        let elements = [1,3,4,5,6,20,30]
        elements.forEach { e  in
            linkedList.append(value: e)
        }
        let the6ThNode = linkedList.node(atIndex: 6)
        
        XCTAssertEqual(the6ThNode.value, elements[6])
        
        linkedList.insert(value: 40, atIndex: 6)
        let theNew6ThNode = linkedList.node(atIndex: 6)
        let the7ThElement = linkedList.node(atIndex: 7)

        XCTAssertEqual(the7ThElement.value, elements[6])
        XCTAssertEqual(theNew6ThNode.value, 40)
    }
    
    func test_removeElementAtIndex_shouldSuccess() {
        let linkedList = makeIntSUT()
        let elements = [1,3,4,5,6,20,30]
        elements.forEach { e  in
            linkedList.append(value: e)
        }
        // using this as a function to make sure when i call it, it will run node(AtIndex each time - but if i created as variable it will make it once at the beginning
        let theOld6ThNode = {
            
         return linkedList.node(atIndex: 6)
        }
        
        
        XCTAssertEqual(theOld6ThNode().value, elements[6])
        
        linkedList.insert(value: 40, atIndex: 6)
        let theNew6ThNode = linkedList.node(atIndex: 6)
        let the7ThElement = linkedList.node(atIndex: 7)
        
        XCTAssertEqual(the7ThElement.value, elements[6])
        XCTAssertEqual(theNew6ThNode.value, 40)
        
        XCTAssertNotEqual(theOld6ThNode().value, elements[6])
        
        linkedList.removeAt(6)
        
        XCTAssertEqual(theOld6ThNode().value, elements[6])
        
    }
    
    func makeIntSUT() -> LinkedList<Int> {
        return LinkedList<Int>()
    }
    
    func makeSUT<T>() -> LinkedList<T> {
        return LinkedList<T>()
    }
}

 class LinkedNode<T> {
    var value: T
    var next: LinkedNode?
    weak var previous: LinkedNode?
    
    public init(value: T) {
        self.value = value
    }
    
    
    
}

public class LinkedList<T> {
    
    private var head: LinkedNode<T>?
    
    public var isEmpty: Bool {
        return head == nil
    }
    
    fileprivate var first: LinkedNode<T>? {
        return head
    }
    
    func isNotEmpty() -> Bool {
        return head != nil
    }
    
    fileprivate var last: LinkedNode<T>? {
        guard var node = head else {
            return nil
        }
        
        while let next = node.next {
            node = next
        }
        return node
    }
    
    public func append(value: T) {
        let newNode = LinkedNode(value: value)
        if let lastNode = last {
            newNode.previous = lastNode
            lastNode.next = newNode
        } else {
            head = newNode
        }
    }
    
    // Counting the nodes
    public var count: Int {
        guard var node = head else {
            return 0
        }
        
        var count = 1 // count of the head
        while let next = node.next {
            node = next
            count += 1
        }
        return count
    }
    
    // Printing the contents of elements
    public var print: String {
       var s = "["
       var node = head
       while node != nil {
           s += "\(node!.value)"
           node = node!.next
           if node != nil { s += ", " }
       }
       return s + "]"
    }
    
    // Get Node at index -> O(n) // because it's loop through elements
    func node(atIndex index: Int) -> LinkedNode<T> {
        if index == 0 {
            return head!
        } else {
            var node = head!.next
            for _ in 1..<index {
                node = node?.next
                if node == nil { //(*1)
                    break
                }
            }
            return node!
        }
    }
    
    func insert(value: T, atIndex index: Int) {
       let newNode = LinkedNode(value: value)
       if index == 0 {
           newNode.next = head
           head?.previous = newNode
           head = newNode
       } else {
           let previousNode = self.node(atIndex: index-1)
           let nextNode = previousNode.next

           newNode.previous = previousNode
           newNode.next = nextNode
           previousNode.next = newNode
           nextNode?.previous = newNode
       }
    }
    func remove(node: LinkedNode<T>) -> T {
        let previousNode = node.previous
        let nextNode = node.next

        if let previousNode = previousNode {
            previousNode.next = nextNode
        } else {
            head = nextNode
        }
        nextNode?.previous = previousNode

        node.previous = nil
        node.next = nil
        return node.value
    }
    
    func removeFirst() -> T {
        return removeAt(0)
    }
    
    @discardableResult
    fileprivate func removeAt(_ index: Int) -> T {
        let nodeToRemove = node(atIndex: index)
        return remove(node: nodeToRemove)
    }
    
}


fileprivate class GraphTests: XCTestCase {
    func test_graph() {
        let exchangeArr = ["EURUSD", "USDGBP", "USDEGP", "EGPEUR", "GBPEGP", "USDAED", "GBPAED", "AEDEGP"]
        // get unique dic of currencies
        var set = Set<String>()
        
        for item in exchangeArr {
            let firstCurrency = item.getSubString(fromIndex: 0, toIncludedIndex: 2)
            let secondCurrency = item.getSubString(fromIndex: 3, toIncludedIndex: 5)
            set.insert(String(firstCurrency))
            set.insert(String(secondCurrency))
        }
        
        
        print("set contains \(set)")
        
    }
}

fileprivate class Graph {
    private var nodeLookup: Dictionary<Int, Node>?
    
    // what is the use of class inside class, it's useful?
    // why the class not outside
    class Node {
        var adjecent = LinkedList<Int>()
        var data: Int
        var id: Int
        init(id: Int, data: Int) {
            self.id = id
            self.data = data
        }
    }
    
    func addEdge(source: Int, destination: Int) {
        let s = getNode(source)

        s?.adjecent.append(value: destination)
    }
    
    func getNode(_ value: Int) -> Node? {
        return nodeLookup?[value]
    }
    
    func hasPathDFS(source: Int, destination: Int) -> Bool {
        guard let sourceNode = getNode(source) else { return false}
        guard let destinationNode = getNode(destination) else { return false}
        
        var visited: Set<Int> = Set()
        return hasPathDFS(source: sourceNode.data, destination: destinationNode.data, visited: &visited)
    }
    
    func hasPathDFS(source: Int, destination: Int, visited:inout Set<Int>) -> Bool {
        if (visited.contains(source)){
            return false
        }
        visited.insert(source)
        
        if source == destination {
            return true
        }
        let sourceNode = getNode(source)
        for i in  0..<(sourceNode?.adjecent.count ?? 0)  {
            if let sourceValue = sourceNode?.adjecent.node(atIndex: i).value {
                return hasPathDFS(source:  sourceValue, destination: destination, visited: &visited)
            }
        }
        
        return false
    }
}

