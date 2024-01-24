//
//  DivideAndConquer.swift
//  DivideAndConquer
//
//  Created by mustafa salah eldin on 10/22/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

class DivideAndConquer: XCTestCase {
    
    func test_divide() {
        let array = [5,4,1,2,3]
        // divide the array into 2 halfs
        // every half will will divide recursively
        
      // base when I have one element return It
        // also compairing between left and right Item
        
        XCTAssertEqual(mergeSort(arr: array), [1,2,3,4,5])
    }
    
    func mergeSort(arr: [Int]) -> [Int] {
        if arr.count <= 1 {
            return arr
        }
        
        let midArrIndex = arr.count/2
        let leftArr: [Int] = mergeSort(arr:Array(arr[0..<midArrIndex]))
        let rightArr: [Int] = mergeSort(arr:Array(arr[midArrIndex..<arr.count]))
        
        var resultArray = [Int]()
        
        if (leftArr.first ?? 0) > (rightArr.last ?? 0) {
            resultArray.append(contentsOf: rightArr)
            resultArray.append(contentsOf: leftArr)
        }
//        else if leftArr.first! > rightArr.first! {
//
//        }
        
        else {
            resultArray.append(contentsOf: leftArr)
            resultArray.append(contentsOf: rightArr)
        }
        
        return resultArray
    }
    
    func merge(leftPile: [Int], rightPile: [Int]) {
        var leftIndex = 0
        var rightIndex = 0
        
        
        var resultArray = [Int]()
            resultArray.reserveCapacity(leftPile.count + rightPile.count)
        
        if leftPile.first! > rightPile.last! {
            resultArray.append(contentsOf: rightPile)
            resultArray.append(contentsOf: leftPile)
        } else {
            
            while (leftIndex < leftPile.count && rightIndex == rightPile.count) {
                if leftPile[leftIndex] > rightPile[rightIndex] {
                    resultArray.append(rightPile[rightIndex])
                    rightIndex += 1
                } else if leftPile[leftIndex] < rightPile[rightIndex] {
                    resultArray.append(rightPile[rightIndex])
                    leftIndex += 1
                }
            }
        }
    }

}
