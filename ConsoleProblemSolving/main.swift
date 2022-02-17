//
//  main.swift
//  ConsoleProblemSolving
//
//  Created by Mustafa Abozaina on 11/19/19.
//  Copyright © 2019 Mustafa Abozaina. All rights reserved.
//

import Foundation


func findBirbesfrom(q:[Int]) -> Void{
        var array = q
        var numberOfBribes = 0

        for i in 0..<q.count - 1 {
            if q[i] - (i+1) > 2 {
                print("Too chaotic")
                return
            }
        }
        
        for i in 0..<array.count {
            
            if array[i] > (i + 1) {
                let shouldBeCurrentElement = i + 1
                for j in i..<array.count {
                    if shouldBeCurrentElement == array[j]{
                        array.insert(i + 1, at: i)
                        array.remove(at: j + 1 )
                        break
                    }
                    numberOfBribes += 1
                }
            }
        }
        print(numberOfBribes)
    }

func bribes(q:[Int]){
    var array = q
    var numberOfBribes = 0

    for i in (0..<q.count).reversed() {
        if array[i] - (i + 1) > 2 {
            print("Too chaotic")
            return
        }
        
        if array[i] != i + 1 {
            if (i - 1 >= 0) && (i + 1 == array[i - 1]) {
                numberOfBribes += 1
                array.swapAt(i, i - 1)
            }else if (i - 2 >= 0) && i + 1 == array[i - 2] {
                numberOfBribes += 2
                array[i - 2] = array[i - 1];
                array[i - 1] = array[i];
                array[i] = i + 1;
            }
            
        }

    }
    print(numberOfBribes)
}

func minimumSwap(arr1: [Int]) -> Int {
    var arr = arr1
    var numberOfSwaps = 0
    var isOrdered = false
    while !isOrdered {
    for i in 0..<arr.count {
        if i + 1 != arr[i] {
            arr.swapAt(i, arr[i] - 1)
            numberOfSwaps += 1
        }
//            for j in i+1..<arr.count { // optimized
//                if arr[j] == i+1 {
//                    arr.swapAt(i, j)
//                    numberOfSwaps += 1
//                }
//            }
//        }
    }
        for i in 0..<arr.count - 1 {
            isOrdered = true
            if arr[i] > arr[i+1]{
                isOrdered = false
                break
            }
        }
    }
    return numberOfSwaps
}

func checkMagazine(magazine: Array<Substring>, note: Array<Substring>) -> Void {
    var magazineDic = Dictionary<Substring,Int>()
    var noteDic = Dictionary<Substring,Int>()
    for mag in magazine {
            magazineDic[mag] = (magazineDic[mag] ?? 0) + 1
    }
    for n in note {
        noteDic[n] = (noteDic[n] ?? 0) + 1
    }
    for (key,_) in noteDic {
        if magazineDic[key] == nil {
            print("No")
            return
        }else if (noteDic[key] ?? 0) > (magazineDic[key] ?? 0) {
            print("No")
            return
        }
        
    }
    
    print("Yes")
}

func twoStrings(s1: String, s2: String) -> String {
    var commonString = ""
    var s1Dic = Dictionary<Character,Character>()
    var s2Dic = Dictionary<Character,Character>()
    for ch in s1 {
        s1Dic[ch] = ch
    }
    for ch in s2 {
        if (s1Dic[ch] != nil) {
            s2Dic[ch] = ch
            return "YES"
        }
    }
    return "NO"
    for (key,value) in s2Dic {
        commonString.append(value)
    }
    return commonString
}


//bribes(q: [1,2,5,3,8,7,6,4])
//findBirbesfrom(q: [1,2,5,3,7,8,6,4])
//bribes(q: [2,1,5,3,4])
//checkMagazine(magazine: "two times three is not four".split(separator: " "), note: "two times two is four".split(separator: " "))
//print(minimumSwap(arr1: [4,3,1,2]))
//print(twoStrings(s1: "hello", s2: "world"))

//
//        var localBribes = 0
//        for j in i..<array.count {
//            if array[i] > array[j] {
//                localBribes += 1
//                if (localBribes == 2) {
//                    break
//                }
//            }
//        }
//        if array[i] > (i + 1) {
//
//            let shouldBeCurrentElement = i + 1
//            for j in i..<array.count {
//                if shouldBeCurrentElement == array[j]{
//                    array.insert(i + 1, at: i)
//                    array.remove(at: j + 1 )
//                    break
//                }
//                numberOfBribes += 1
//            }
//        }



//let start = DispatchTime.now() // <<<<<<<<<< Start time
//let list = [ 10, 0, 3, 9, 2, 14, 8, 27, 1, 5, 8, -1, 26]
//print(mergeSort(list))
//let end = DispatchTime.now()
//let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
//print("Nano \(nanoTime)")


//plusMinus()
//
//minMaxSum()

//takeInputFromUser(n: 2, m: 2) /// ! unsolved time
//let list1 = [12,15,17,6,5,8,3,2,20,19,18,22,4,1,9,7,0,11,13,14,]
//let list2 = [5,8,1,3,7,9,2]
//print(quickSort(array: list2))
//print(insertionSort())
//print(caeserCipher(word: "!m-rB`-oN!.W`cLAcVbN/CqSoolII!SImji.!w/`Xu`uZa1TWPRq`uRBtok`xPT`lL-zPTc.BSRIhu..-!.!tcl!-U", encyptionKey: 62))

//print(flippingMatrix())

//func summition(n: Int) -> Int {
//    var sum = 1
//    if n == 1 {
//        return 1
//    }
//    sum *= summition(n: n - 1)
//    return sum * n
//}
//
//print(summition(n: 5))

//print(quickSort(array: [1,2,7,8,5,4,6]))

//Tree().addNode(values: [1,2,13,14,15,16,17,8,9,11,12,3,4,5,6,7,18,19]).printInOrder()
//Tree().addNode(values: [1,2,13,14,15,16,17,8,9,11,12,3,4,5,6,7,18,19]).printPreOrder()
//Tree().addNode(values: [1,2,13,14,15,16,17,8,9,11,12,3,4,5,6,7,18,19]).printPostOrder()

Tree().addNode(values: [1,2,5,3,4,6]).printPostOrder()
