//
//  AddTwoLinkedLists.swift
//  LeetCodeStudyPlan
//
//  Created by mustafa salah eldin on 9/9/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

class AddTwoLinkedLists: XCTestCase {
    
    func test_bset() {
        let solution = Solution()
        
        let l1 =  [2,4,3]//[0] // [9,9,9,9,9,9,9],
        let l2 =  [5,6,4]//[0] // [9,9,9,9]
        let expectedResult =  [7,0,8] //[0] // [8,9,9,9,0,0,0,1]
        
        let node1 = solution.convertArrayToLinkedList(arr: l1)
        let node2 = solution.convertArrayToLinkedList(arr: l2)
        let linkedNode = solution.addTwoNumbers(node1, node2)
        let arr = Solution().convertLinkedListToArray(l: linkedNode)
        
        XCTAssertEqual(arr, expectedResult)
    }
    
    public class ListNode {
        public var val: Int
         public var next: ListNode?
         public init() { self.val = 0; self.next = nil; }
         public init(_ val: Int) { self.val = val; self.next = nil; }
         public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next}
    }
    
   class Solution {
       func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
           
           // to know last node check if next = nil and in that case put all the number and
           // if it greater than 10 so divide it onto two slots
           // this can be done by making modulus and division
           // the modulus to get the remainder and the division to get the decimal value
           // exampel 21 / 10 = 2.1 , and mod 21 % 10 = 1
           // so the decimal number here is 2 will added to new elmeents and set at current array slot the mod

           // Sum two elements should every index sum with the equivelent
           // so we should convert linkedList into array and sum both of them
           let array1 = convertLinkedListToArray(l: l1)
           let array2 = convertLinkedListToArray(l: l2)

           let test1 = [1,2,3,4]
           let aa = convertArrayToLinkedList(arr: test1)
           let ar = convertLinkedListToArray(l: aa)

           print("ar", ar)


           // we should loop through the largest array
           var largeArray = array1.count >= array2.count ? array1 : array2
           var smallArray = array1.count >= array2.count ? array2 : array1
           let smallArrayCount = smallArray.count
           for i in smallArrayCount..<largeArray.count {
               smallArray.append(0)
           }

       debugPrint("array1 is",largeArray, smallArray)
       var resultArray = [Int]()
           for i in 0..<largeArray.count {
               let sum = largeArray[i] + smallArray[i]
               // if greater than 10
               let mod = sum % 10
               let divide: Int = sum / 10

               if mod == sum {
                   resultArray.append(sum)
               } else {
                   resultArray.append(mod)
                   if largeArray.count > i + 1 {
                       largeArray[i+1] += divide
                   } else {
                       resultArray.append(divide)
                   }

               }

           }

   return convertArrayToLinkedList(arr: resultArray)

       }

       fileprivate func convertLinkedListToArray(l: ListNode?) -> [Int] {
           let array = getListNodeValues(node: l)
           return array
       }

       private func getListNodeValues(node: ListNode?) -> [Int] {
           var arr = [Int]()
           guard let node = node else {return []}
           if node.next == nil {
               arr.append(node.val)
           } else {
               arr.append(node.val)
               arr.append(contentsOf: getListNodeValues(node: node.next))
           }
           return arr
       }

       fileprivate func convertArrayToLinkedList(arr: [Int]) -> ListNode {
           var head = ListNode(arr.first!)
           var lastNode: ListNode? = head
           for i in 1..<arr.count {
               lastNode?.next = ListNode(arr[i])
               lastNode = lastNode?.next
           }
           return head
       }
   }

//    func test_addTwoLinkedLists() {
//        let node1 = buildLinkedListFromArray([9,9,9,9,9,9,9]) //[2,4,3]
//        let node2 = buildLinkedListFromArray([9,9,9,9]) // [5,6,4]
//
//
//        var node1Elements = getNodeValues(node: node1)
//        var node2Elements = getNodeValues(node: node2)
//
//        var length = node1Elements.count > node2Elements.count ? node1Elements.count : node2Elements.count
//
//        var sum = [Int]()
//        var equivelentAdd = 0 // for new loop
//        for i in 0..<length {
//            if i > node1Elements.count - 1 {
//                node1Elements.append(0)
//            }
//            if i > node2Elements.count - 1 {
//                node2Elements.append(0)
//            }
//             equivelentAdd = node1Elements[i] + node2Elements[i]
//            if equivelentAdd >= 10 {
//                // get value
//                // get value of decimal (dd)
//                var dif = equivelentAdd % 10
//                let rest = equivelentAdd / 10
//                if length == i - 1 {
//                    sum.append(rest)
//                    if equivelentAdd > 10 {
//                        sum.append(dif)
//                    }
//                } else {
//                    sum.append(rest)
//                    node1Elements[i+1] += dif
//                }
//
//            } else {
//                sum.append(equivelentAdd)
//            }
//        }
//        XCTAssertEqual(sum, [7,0,8])
//
//    }
//
//    func test_mod() {
//        let a = 11 % 10
//        XCTAssertEqual(a, 5)
//    }
//
//



}
