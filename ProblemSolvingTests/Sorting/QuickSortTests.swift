//
//  SortingTests.swift
//  ProblemSolvingTests
//
//  Created by mustafa salah eldin on 6/26/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest
import Foundation


// Complexities:-
// Time: Avarage: O(nlogn), Worst: O(N2),  Space: O(logN)
// Idea: using Pivot technique with Recusive (divide and conquor)
    // The pivot is the last index and compared with every element before It
    // then => use recursion and divide the array into 2 halfs
    // then => each half do the same process (comparing pivot with previous)
    // finally => for It and return the arr count == 1

// Note: When array = 2 elements  it divided to left:1 right:1 so every branch return 1 element and this lets the function of 2 indices return 2 elmenets and concatenate with the other branches which return 1 or 2 elements
// 


 func quickSort(array: [Int]? = nil) -> [Int]{
    var arr = [5,3,1,2,4]

    if let _ = array {
        arr = array!
    }
     debugPrint("function arr beginning \(arr)")

    if arr.isEmpty {
        return []
    }
     
    else
    if arr.count == 1 {
        return [arr.first!]
    }
    
    let pivot = arr.last!
    var lastSmallerElementIndex = -1 // because there is no any smaller yet // smaller than pivot
    
    // Loop through array and compare pivot(last index) with the array[currentIndex]
    for currentIndex in 0..<arr.count - 1 {
        if arr[currentIndex] <= pivot {
            let theElementIndexAfterSmallerIndex = lastSmallerElementIndex + 1
            arr.swapAt(theElementIndexAfterSmallerIndex, currentIndex)
            lastSmallerElementIndex += 1
        }
    }
    arr.swapAt(lastSmallerElementIndex + 1, arr.endIndex - 1)
    print("after global swap \(arr)")
    return quickSort(array: arr.split(leftLastIndex: lastSmallerElementIndex + 1).left) + quickSort(array: arr.split(leftLastIndex: lastSmallerElementIndex + 1).right)
}

class QuickSortTests: XCTestCase {

    func test_quickSort()  {
        let arr = quickSort(array: [5,3,2,1,4])
        XCTAssertEqual(arr, arr.sorted())
    }

}



extension Array {
    func split() -> (left: [Element], right: [Element]) {
        let ct = self.count
        let half = ct / 2
        let leftSplit = self[0 ..< half]
        let rightSplit = self[half ..< ct]
        return (left: Array(leftSplit), right: Array(rightSplit))
    }
}



extension Array {
    func split(leftLastIndex: Int) -> (left: [Element], right: [Element]) {
        let leftArr = self[0 ..< leftLastIndex]
        let rightArr = self[leftLastIndex ..< self.count]
        return (left: Array(leftArr), right: Array(rightArr))
    }
}
