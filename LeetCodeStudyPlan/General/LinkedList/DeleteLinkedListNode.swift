//
//  DeleteLinkedListNode.swift
//  LeetCodeStudyPlan
//
//  Created by mustafa salah eldin on 9/9/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

class DeleteLinkedListNodeTests: XCTestCase {

    func test_deleteNodeNotAHeadOrTailNode() {
        let nodes = getLinkedListNodesFromArray([4,5,1,9])
        let selectedNode = nodes?[1]
        
        deleteNode(selectedNode)
        
        XCTAssertEqual(getNodeValues(node: nodes?.first), [4,1,9])
    }
    
    func deleteNode(_ node: ListNode?) {
            node?.val = node?.next?.val ?? -1
            if let farNext = node?.next?.next {
             node?.next = farNext
            } else {
                node?.next = nil
            }
        }
}




/*
 There is a singly-linked list head and we want to delete a node node in it.

 You are given the node to be deleted node. You will not be given access to the first node of head.

 All the values of the linked list are unique, and it is guaranteed that the given node node is not the last node in the linked list.

 Delete the given node. Note that by deleting the node, we do not mean removing it from memory. We mean:

 The value of the given node should not exist in the linked list.
 The number of nodes in the linked list should decrease by one.
 All the values before node should be in the same order.
 All the values after node should be in the same order.
 Custom testing:

 For the input, you should provide the entire linked list head and the node to be given node. node should not be the last node of the list and should be an actual node in the list.
 We will build the linked list and pass the node to your function.
 The output will be the entire list after calling your function.
 */
