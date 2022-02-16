//
//  Insertion.swift
//  ConsoleProblemSolving
//
//  Created by mustafa salah eldin on 2/16/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import Foundation

func insertionSort() {
    var arr = [1,2,4,5,3]
    
    // Loop through main elements
    for i in 1..<arr.count {
        let key = arr[i] // key is the compared element
        var j = i-1 // index of previous element

        //while J not zero && the element of J is greater than key so we should swap and complete till j == 0 or to find that key is greater from its previous element
        while (j>=0 && arr[j]>key) {
            arr[j+1] = arr[j]
            print(arr)
            j -= 1
        }
        arr[j+1] = key
    }
    arr.forEach{print($0, terminator:" ")}
    print(arr)
}
