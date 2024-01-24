//
//  Quick.swift
//  ConsoleProblemSolving
//
//  Created by mustafa salah eldin on 2/16/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import Foundation

// Complexities:-
// Time: Avarage: O(nlogn), Worst: O(N2),  Space: O(logN)
// Idea: using Pivot technique with Recusive (divide and conquor)
// The pivot is the last index and compared with every element before It
   // then => use recursion and divide the array into 2 halfs
   // then => each half do the same process
   // finally => for It and return the arr count == 1


public func quickSort(array: [Int]? = nil) -> [Int]{
    var arr = [5,3,1,2,4]
    print("function arr beginning \(arr)")
    if let _ = array {
        arr = array!
    }
    if arr.isEmpty {
        return []
    }
    else
    if arr.count == 1 {
        return [arr.first!]
    }
    
    let pivot = arr.last!
    var lastSmallerElementIndex = -1 // because there is no any smaller yet
    
    // Loop through array and compare pivot(last index) with the array[currentIndex]
    for currentIndex in 0..<arr.count - 1 {
        if arr[currentIndex] <= pivot {
            let theElementAfterSmallerIndex = lastSmallerElementIndex + 1
            arr.swapAt(theElementAfterSmallerIndex, currentIndex)
            lastSmallerElementIndex += 1
        }
    }
    arr.swapAt(lastSmallerElementIndex + 1, arr.endIndex - 1)
    print(arr)
    return quickSort(array: arr.split(leftLastIndex: lastSmallerElementIndex + 1).left) + quickSort(array: arr.split(leftLastIndex: lastSmallerElementIndex + 1).right)
}

// here use centered pivot
func quicksort<T: Comparable>(_ a: [T]) -> [T] {
    
  guard a.count > 1 else { return a }

  let pivot = a[a.count/2]
  let less = a.filter { $0 < pivot }
  let equal = a.filter { $0 == pivot }
  let greater = a.filter { $0 > pivot }

  return quicksort(less) + equal + quicksort(greater)
}

