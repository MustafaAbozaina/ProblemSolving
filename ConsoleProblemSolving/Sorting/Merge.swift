//
//  Merge.swift
//  ConsoleProblemSolving
//
//  Created by mustafa salah eldin on 2/16/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import Foundation

// Complexities:-
// Time: O(N LogN) in 3 cases, Space: O(N)
// Merge Sort is recursive Algorithm
//=> Its Idea depending on [Mergeing] two divided array from the original array
// desc: divide each single array till reach 2 elements and then retrieve them sorted

func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
  // 1
  var leftIndex = 0
  var rightIndex = 0

  // 2
  var orderedPile = [Int]()
  orderedPile.reserveCapacity(leftPile.count + rightPile.count)

  // 3
  while leftIndex < leftPile.count && rightIndex < rightPile.count {
    if leftPile[leftIndex] < rightPile[rightIndex] {
      orderedPile.append(leftPile[leftIndex])
      leftIndex += 1
    } else if leftPile[leftIndex] > rightPile[rightIndex] {
      orderedPile.append(rightPile[rightIndex])
      rightIndex += 1
    } else {
      orderedPile.append(leftPile[leftIndex])
      leftIndex += 1
      orderedPile.append(rightPile[rightIndex])
      rightIndex += 1
    }
  }

  // 4
  while leftIndex < leftPile.count {
    orderedPile.append(leftPile[leftIndex])
    leftIndex += 1
  }

  while rightIndex < rightPile.count {
    orderedPile.append(rightPile[rightIndex])
    rightIndex += 1
  }

  return orderedPile
}

func mergeSort(_ array: [Int]) -> [Int] {
  guard array.count > 1 else { return array }    // 1

  let middleIndex = array.count / 2              // 2

  let leftArray = mergeSort(Array(array[0..<middleIndex]))             // 3

  let rightArray = mergeSort(Array(array[middleIndex..<array.count]))  // 4

  return merge(leftPile: leftArray, rightPile: rightArray)             // 5
}
// execution code
let start = DispatchTime.now() // <<<<<<<<<< Start time
let list = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26]
//print(mergeSort(list))
let end = DispatchTime.now()
let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
//print("Nano \(nanoTime)")

