//
//  AllDataStructuresInSwift.swift
//  AlgoLab150Problems
//
//  Created by Mustafa Abozaina on 06/12/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//

import Foundation
/*
Data structures are the building blocks of computer science and software development. They allow us to store and manipulate data efficiently. Swift, a powerful and intuitive programming language developed by Apple, offers a wide range of data structures to choose from.


In this tutorial, we'll explore various data structures available in Swift, their use cases, and provide code samples to help you understand how to implement and use them effectively.


Data Structures available in Swift
Arrays

Dictionaries

Sets

Stacks

Queues

Linked Lists

Trees (Binary Trees)

Graphs


1. Arrays

Arrays in Swift are ordered collections of elements with a fixed size. You can store elements of the same type in an array. Here's how you create and use arrays:
*/

// Creating an array of integers
var numbers = [1, 2, 3, 4, 5]

// Accessing elements
let firstElement = numbers[0]

// Modifying elements
numbers.append(6)
numbers[2] = 10
// Iterating through an array
for number in numbers {
    print(number)
}

/*
Use Cases: Arrays are suitable for scenarios where you need to store and access a list of items in a specific order. They are efficient for random access but may not be the best choice for frequent insertions or deletions.


2. Dictionaries

Dictionaries in Swift are collections of key-value pairs. Each key in a dictionary is unique, and you can use the key to retrieve its corresponding value.
 */

// Creating a dictionary
var studentGrades = ["Alice": 90, "Bob": 85, "Charlie": 92]

// Accessing values
let aliceGrade = studentGrades["Alice"]

// Modifying values
studentGrades["David"] = 88
// Iterating through a dictionary
for (name, grade) in studentGrades {
    print("\(name): \(grade)")
}

/*
Use Cases: Dictionaries are ideal when you need to associate values with unique keys. They are efficient for quick lookups based on keys.


3. Sets

Sets in Swift are unordered collections of unique values. They ensure that each element appears only once.
*/
// Creating a set of integers
var uniqueNumbers: Set<Int> = [1, 2, 3, 3, 4, 5]

// Adding and removing elements
uniqueNumbers.insert(6)
uniqueNumbers.remove(3)

// Checking membership
let containsFive = uniqueNumbers.contains(5)

/*
Use Cases: Sets are useful when you need to ensure the uniqueness of elements or when you want to perform set operations like union, intersection, and difference.


4. Stacks

A stack is a data structure that follows the Last-In-First-Out (LIFO) principle. You can push elements onto the stack and pop them off the stack in reverse order.
 */

// Creating a stack
var stack: [Int] = []

// Pushing elements onto the stack
stack.append(1)
stack.append(2)
stack.append(3)

// Popping elements
let poppedElement = stack.popLast()


/*
Use Cases: Stacks are helpful in scenarios like implementing an undo feature or parsing expressions where you need to reverse the order of processing.


5. Queues

Queues are data structures that follow the First-In-First-Out (FIFO) principle. Elements are added to the rear and removed from the front of the queue.
*/
// Creating a queue


var queue: [Int] = []

// Enqueuing elements
queue.append(1)
queue.append(2)
queue.append(3)

// Dequeuing elements
let dequeuedElement = queue.removeFirst()

/*
Use Cases: Queues are essential for scenarios like task scheduling, managing print jobs, and implementing algorithms like Breadth-First Search.


6. Linked Lists

Linked lists consist of nodes where each node contains a value and a reference (or link) to the next node. Linked lists come in various forms, including singly linked lists, doubly linked lists, and circular linked lists.
 */

// Node structure for a singly linked list
class Node<T> {
    var value: T
    var next: Node?
    
    init(_ value: T) {
        self.value = value
    }
}

// Creating a singly linked list
let node1 = Node(1)
let node2 = Node(2)
let node3 = Node(3)

node1.next = node2
node2.next = node3

/*
Use Cases: Linked lists are suitable when you need dynamic resizing or when you frequently insert or delete elements in the middle of the list.


7. Trees (Binary Trees)

Trees are hierarchical data structures with a root node and child nodes. Binary trees have at most two child nodes per parent node.
 */

// Node structure for a binary tree
class BinaryTreeNode<T> {
    var value: T
    var left: BinaryTreeNode?
    var right: BinaryTreeNode?
    
    init(_ value: T) {
        self.value = value
    }
}

// Creating a binary tree
let root = BinaryTreeNode(1)
root.left = BinaryTreeNode(2)
root.right = BinaryTreeNode(3)

/*
Use Cases: Binary trees are suitable for various applications, including representing hierarchical data, searching, and sorting algorithms (e.g., binary search tree).


8. Graphs

Graphs are complex data structures consisting of nodes (vertices) and edges that connect the nodes. They can be directed or undirected and have various representations, including adjacency lists and adjacency matrices.
 */

// Implementing an adjacency list for a graph
class Graph {
    var adjacencyList: [Int: [Int]] = [:]
    
    func addEdge(from source: Int, to destination: Int) {
        if adjacencyList[source] == nil {
            adjacencyList[source] = []
        }
        adjacencyList[source]?.append(destination)
    }
}

// Creating a graph
let graph = Graph()
graph.addEdge(from: 1, to: 2)
graph.addEdge(from: 1, to: 3)
graph.addEdge(from: 2, to: 4)

/*
Use Cases: Graphs are used for modeling complex relationships and solving various problems, such as route finding, network analysis, and recommendation systems.


Conclusion

Data structures play a fundamental role in computer science and programming. Swift provides a wide array of data structures that you can leverage to build efficient and scalable applications. Understanding these data structures and their use cases is essential for becoming a proficient Swift developer. As you gain experience, you'll be able to choose the right data structure for each problem you encounter, ultimately leading to more elegant and performant code.
 */
