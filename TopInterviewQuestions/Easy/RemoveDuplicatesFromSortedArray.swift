//
//  File.swift
//  TopInterviewQuestions
//
//  Created by mustafa salah eldin on 12/19/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

// LearnedLesson
/*
 1- If you need to remove elements while looping on arr, Use while witout increasing the index in case of remvoing
 2- removing element while looping is bad habbit, don't do It
 3- If you want to remove a specific elements, you can save their indices or mark them with a special mark
 
 */

import XCTest

// Revisit =>
class RemoveDuplicatesFromSortedArray: XCTestCase {
    
    func test_compare() {
//        var nums = [0,0,1,1,1,1,2,2,2]
        var nums = [1,1,2]
        let a = removeDuplicatesByCompare(nums: &nums)
        XCTAssertEqual(a, 3)
    }
    
    //dropping last
    func removeDuplicatesByCompare(nums: inout [Int]) -> Int {
        var lastIndexOfChangedElement = 0
        var variableToCompare = nums.first!
        
                for i in 0..<nums.count - 1 {
                    if variableToCompare != nums[i + 1] {
                        variableToCompare = nums[i+1]
                        lastIndexOfChangedElement += 1
                        let temp = nums[i+1]
                        nums[i+1] = nums[lastIndexOfChangedElement]
                        nums[lastIndexOfChangedElement] = temp
                    }
                    
                }
                print("nums before drop", nums)
                let elementsToBeDeleted = nums.count - (lastIndexOfChangedElement + 1)
                nums = nums.dropLast(elementsToBeDeleted)
                print("nums after drop", nums)
                return nums.count
    }
    
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        // loop through array
        //
        var seta = Set<Int>()
        var i = 0
        
        // bad => almost O(n2) because of remvoing
        while (i < nums.count) {
            if seta.contains(nums[i]) {
                // nums[i] = -522
                nums.remove(at: i)
            } else {
                seta.insert(nums[i])
                i += 1
            }
        }
        
        // best of time O(n) // problem here we need to make sure that thefilter number is not exist in the original array
        for i in 0..<nums.count {
            if seta.contains(nums[i]) {
                nums[i] = -522
                //                            nums.remove(at: i) // Will crash
            } else {
                seta.insert(nums[i])
            }
        }
        nums = nums.filter({$0 != -522})
        
        
        var lastElementToChange = 0
        for i in 0..<nums.count - 1{
            if nums[i] != nums[i + 1] {
                lastElementToChange += 1
                let temp = nums[lastElementToChange]
                nums[lastElementToChange] = nums[i]
                nums[i] = temp
            }
            
        }
        let elementsToBeDeleted = nums.count - lastElementToChange
        nums = nums.dropLast(elementsToBeDeleted)
        return nums.count
    }
}

// The problem

//Given an integer array nums sorted in non-decreasing order, remove the duplicates in-place such that each unique element appears only once. The relative order of the elements should be kept the same.
//
//Since it is impossible to change the length of the array in some languages, you must instead have the result be placed in the first part of the array nums. More formally, if there are k elements after removing the duplicates, then the first k elements of nums should hold the final result. It does not matter what you leave beyond the first k elements.
//
//Return k after placing the final result in the first k slots of nums.
//
//Do not allocate extra space for another array. You must do this by modifying the input array in-place with O(1) extra memory.
