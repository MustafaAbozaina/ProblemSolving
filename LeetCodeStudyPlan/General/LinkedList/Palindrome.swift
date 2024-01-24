//
//  Palindrome.swift
//  LeetCodeStudyPlan
//
//  Created by mustafa salah eldin on 9/8/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

//https://leetcode.com/problems/palindrome-linked-list/

import XCTest

class PalindromeLinkedListTests: XCTestCase {
    
    func test_isPalindrome() {
        let head = buildLinkedListFromArray([1,2,2,1])
        let lToR = getNodeValues(node: head)
        let rToL = getNodeValues(node: reversLinkedList(node: head).first)
        
        XCTAssertEqual(lToR, rToL)
    }
    
    func test_buildLinkedListFromArray() {
        let head = buildLinkedListFromArray([1,2,3,4,5])
        XCTAssertEqual(getNodeValues(node: head), [1,2,3,4,5])
    }
    
    func test_reverseLinkedList() {
        let linkedList = buildLinkedListFromArray([1,2,3,4,5])
        let head = reversLinkedList(node: linkedList)
        
        XCTAssertEqual(getNodeValues(node: head.last), [5,4,3,2,1])
    }
    
    
    func reversLinkedList(node: ListNode?) -> [ListNode] {
        // base
        var arr = [ListNode]()
        if node?.next == nil {
         return [node!]
        }
        
        arr = reversLinkedList(node: node?.next)
        arr.append(node!)// O(1)
        let next = node?.next
        next?.next = node
        node?.next = nil
        
        return arr

    }
    
}

 public class ListNode {
      public var val: Int
      public var next: ListNode?
      public init() { self.val = 0; self.next = nil; }
      public init(_ val: Int) { self.val = val; self.next = nil; }
      public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 }


    // Version that error time complexity

//func getNodeValues(node: ListNode?) -> [Int] {
//    // base
//    var arr = [Int]()
//    if node?.next == nil {
//        return [node?.val ?? -1]
//    }
//    var arr1 = [node?.val ?? -1]
//    arr1.append(contentsOf: getNodeValues(node: node?.next))
//    arr.append(contentsOf: arr1)
//    return arr
//}
//
//func reversLinkedList(node: ListNode?) -> [ListNode] {
//    // base
//    var arr = [ListNode]()
//    if node?.next == nil {
//     return [node!]
//    }
//    arr.append(node!)
//    arr.append(contentsOf: reversLinkedList(node: node?.next))
//    let next = node?.next
//    next?.next = node
//    node?.next = nil
//    
//    return arr
//
//}



// Version accepted
//Runtime: 982 ms, faster than 78.54% of Swift online submissions for Palindrome Linked List.
//Memory Usage: 32.2 MB, less than 10.67% of Swift online submissions for Palindrome Linked List.
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
class Solution {
    func isPalindrome(_ head: ListNode?) -> Bool {
        let lToR = getNodeValues(node: head)
        let rToL = getNodeValues(node: reversLinkedList(node: head).first)
        
        if lToR == rToL {
            return true
        } else {
            return false
            }
    }
    func getNodeValues(node: ListNode?) -> [Int] {
        // base
        var arr = [Int]()
        if node?.next == nil {
            return [node?.val ?? -1]
        }
        arr = getNodeValues(node: node?.next)
        arr.append(node?.val ?? -1)
        
        return arr
    }
    
    func reversLinkedList(node: ListNode?) -> [ListNode] {
        // base
        var arr = [ListNode]()
        if node?.next == nil {
         return [node!]
        }
        
        arr = reversLinkedList(node: node?.next)
        arr.append(node!)
        let next = node?.next
        next?.next = node
        node?.next = nil
        
        return arr

    }
}
