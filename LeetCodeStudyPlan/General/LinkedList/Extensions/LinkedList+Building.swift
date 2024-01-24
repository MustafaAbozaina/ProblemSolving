//
//  LinkedList+Building.swift
//  LeetCodeStudyPlan
//
//  Created by mustafa salah eldin on 9/9/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

extension XCTestCase {
    func getNodeValues(node: ListNode?) -> [Int] {
        // base
        var arr = [Int]()
        if node?.next == nil {
            return [node?.val ?? -1]
        }
        arr = [node?.val ?? -1] // O(1)
        arr.append(contentsOf: getNodeValues(node: node?.next))
        
        return arr
    }
    
    
    func buildLinkedListFromArray(_ arr: [Int]) -> ListNode? {
        var listNodes = [ListNode]()
        for element in arr {
            let node = ListNode(element)
            listNodes.append(node)
        }
        for i in 0..<listNodes.count - 1 {
            listNodes[i].next = listNodes[i+1]
        }
        return listNodes.first
    }
    
    func getLinkedListNodesFromArray(_ arr: [Int]) -> [ListNode]? {
        var listNodes = [ListNode]()
        for element in arr {
            let node = ListNode(element)
            listNodes.append(node)
        }
        for i in 0..<listNodes.count - 1 {
            listNodes[i].next = listNodes[i+1]
        }
        return listNodes
    }
}
