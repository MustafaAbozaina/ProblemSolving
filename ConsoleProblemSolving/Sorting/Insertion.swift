//
//  Insertion.swift
//  ConsoleProblemSolving
//
//  Created by mustafa salah eldin on 2/16/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import Foundation


// Complexities
// Time: B: O(n) W: O(n2),  Space: O(1)
// The Idea,
// 1- Start the array from index 1 and make it Pivot
// 2- compare the pivot with Its direct previous element by make previous(j) = index(i) - 1
// 3- If the Pivot greater than the previous -> complete the loop else -> swap



func insertionSort() {
    var arr = [1,2,4,5,3]
    
    // Loop through main elements
    for i in 1..<arr.count {
        let key = arr[i] // key is the compared element
        var j = i-1 // index of previous element

        //while J not zero && the element of J is greater than key so we should swap and complete till j == 0 or to find that key is greater from its previous element
        while (j>=0 && isPreviousGreaterThanPivot(previous: arr[j], pivot: key) ) {
            
            arr[j+1] = arr[j]
            print(arr)
            j -= 1
        }
        arr[j+1] = key
    }
    arr.forEach{print($0, terminator:" ")}
    print(arr)
}

func isPreviousGreaterThanPivot(previous: Int, pivot: Int) -> Bool {
    //arr[j]>key
    if previous > pivot {
        return true
    }
    return false
}
