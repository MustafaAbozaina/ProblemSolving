//
//  MergeTwoSortedLists.swift
//  AlgoLab150Problems
//
//  Created by Mustafa Abozaina on 14/01/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//
// 2. Merge Two Sorted Lists: https://leetcode.com/problems/merge-two-sorted-lists

import XCTest

final class MergeTwoSortedLists: XCTestCase {
    
    func test_d() {
        let list1 = ListNode(1, ListNode(3, ListNode(4)))
        let list2 = ListNode(1, ListNode(2, ListNode(4, ListNode(5))))
        let result = mergeTwoLists(list1, list2)
        XCTAssertNotNil(result)
    }
    
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        // To merge two lists, just make the head of second is the next of tail of the first
        
        // Problem comes in sorting
        // solution scenarios
        // should I convert to array and sort
        
        // functions of LinkedLists (add, remove, makeHead, makeTail)
        // we will compare head of both and know which greater
        
        // get the first element (head) from first LinkedList that greater than the head in the second array -> because this element should lay after It
        
        
        // by this we have the elements to be ordered
        // ordering them
        // adding them to the tail of
        
        /// Another way of describing and explaining the issue
        /// we need to sort linked list that separated to two separated sorted linkedLists
        /// The problem could be solved in one line if the each linked list sorted in the way that we could merge directly
        /// But, The problem that the first linkdList could have elements greater than the second one or vice versa
        /// So, Suggest solution, I will use while (firstLinkedList.isNotEmpty && secondLinkedl.isNotEmpty)
        /// => compare the head of both LinkedLists, the smaller one, remove It and make the next one is the head and continue looping
        /// else if one of them has data and the other is empty, add the head of the linkedList that contains data directly into the tail of the mergedLinkedList
        var modifiableList1 = list1
        var modifiableList2 = list2
        let firstAndSecondLinkedListContainsData = (modifiableList1?.val != nil && modifiableList2?.val != nil)
        
        var fullList: LinkedList? = LinkedList()
        
        while (firstAndSecondLinkedListContainsData) {
            var selectedNode: ListNode?
            guard let list1Value = modifiableList1?.val, let list2Value = modifiableList2?.val else {break}
            if list1Value > list2Value {
                selectedNode = modifiableList2
                removeHead(listNode: &modifiableList2)
            } else {
                selectedNode = modifiableList1
                removeHead(listNode: &modifiableList1)
            }
            
            fullList?.add(node: selectedNode)
        }
        if let firstList = modifiableList1 {
            fullList?.add(node: modifiableList1)
        } else if let secondList = modifiableList2 {
            fullList?.add(node: modifiableList2)
        }
        fullList?.traverseLinkedList(listNode: fullList?.head)
        return fullList?.head
    }
    private func removeHead(listNode: inout ListNode?) {
        listNode = listNode?.next
    }
    
    private func getTailOf(listNode: ListNode?) -> ListNode? {
        if listNode?.next == nil {
            return listNode
        } else {
            return  getTailOf(listNode: listNode?.next)
        }
    }
    
    
}


// Definition for singly-linked list.
public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next;
        
    }
}

class LinkedList {
    var head: ListNode?
    var tail: ListNode?
    
    func isEmpty() -> Bool {
        guard let _ = head else {
            return true
        }
        return false
    }
    
    func isNotEmpty() -> Bool {
        return !isEmpty()
    }
    
    func add(node: ListNode?) {
        if let head = head {
            tail?.next = node // in case the head == tail, we here put the next to the head
            tail = node
        } else {
            head = node
            tail = node
        }
    }
    
    func traverseLinkedList(listNode: ListNode?) {
        print(listNode?.val ?? -1)
        if listNode?.next == nil {
            return
        }
        traverseLinkedList(listNode: listNode?.next)
    }
    
}


