//
//  TwoPointers.swift
//  ProblemSolvingTests
//
//  Created by mustafa salah eldin on 6/25/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

class TwoPointers: XCTestCase {

    func test_sum2Numbers_shouldEqualTargetNumber() {
        let targetNumber = 9
        let arr = [1,2,3,4,5,6]
        let sortedArray = arr.sorted()
        var resultNumbersIndices = [Int]()
        // loop through array with two indices
        // start, end
        // we could follow opposite or equi - directional
        
        // two pointers means using (while)
        
        var start = 0
        var end = sortedArray.count - 1
        
        while (start < end) {
            let sum = sortedArray[start] + sortedArray[end]
            if sum == targetNumber {
                resultNumbersIndices = [sortedArray[start], sortedArray[end]]
                break
            } else if sum > targetNumber {
                end -= 1
            } else {
                start += 1
            }
        }
        
        XCTAssertEqual(resultNumbersIndices, [3,6])
    }
    
    func test_sumDifferent2Numbers_shouldEqualTargetNumber() {
        let targetNumber = 9
        let arr = [1,2,3,4,5,6]
        let sortedArray = arr.sorted()
        var resultNumbersIndices = [Int]()
        // loop through array with two indices
        // start, end
        // we could follow opposite or equi - directional
        
        // two pointers means using (while)
        
        var start = 0
        var end = sortedArray.count - 1
        
        while (start < end) {
            let sum = sortedArray[start] + sortedArray[end]
            if sum == targetNumber {
                resultNumbersIndices.append(contentsOf: [sortedArray[start], sortedArray[end]])
                start += 1
            } else if sum > targetNumber {
                end -= 1
            } else {
                start += 1
            }
        }
        
        XCTAssertEqual(resultNumbersIndices, [3,6,4,5])
    }
    
    func test_threeSumDiscussionSolution() {
        var resultArray = threeSum([-4,-2,1,-5,-4,-4,4,-2,0,4,0,-2,3,1,-5,0])
        XCTAssertEqual(resultArray, [[-2, 1, 1], [-4, 0, 4], [-5, 1, 4], [0, 0, 0], [-4, 1, 3], [-2, -2, 4]])
    }
    
    // Discussion solution
    func threeSum(_ nums: [Int]) -> [[Int]] {
            guard nums.count > 2 else {return []}
           
            let sortedNums = nums.sorted(by: <)
            var triplets: Set<[Int]> = []
           
            var left = 0
            var right = nums.count - 1
            var subs = 1
            
            while left < nums.count {
                while subs < right {
                    if sortedNums[left] + sortedNums[subs] + sortedNums[right] == 0  {
                        let triplet = [sortedNums[left], sortedNums[subs], sortedNums[right]]
                            triplets.insert(triplet)
                        subs += 1
                        right -= 1
                    } else if sortedNums[left] + sortedNums[subs] + sortedNums[right] < 0                 {
                       subs += 1
                    } else if sortedNums[left] + sortedNums[subs] + sortedNums[right] > 0 {
                      right -= 1
                    }
                }
                
                left += 1
                subs = left + 1
                right = nums.count - 1
                
            }
            return Array(triplets)
        }
    
    
    // My Solutions
    func test_sumTripletsOptimization_shouldEqualTheTarget() {
//        let target = 0
//        let nums = [-4,-2,1,-5,-4,-4,4,-2,0,4,0,-2,3,1,-5,0]//[Int]()//[-4,-3,-2,-1,-1,0,0,1,2,3,4]//[-4, -1, -1, 0,1, 2]
//        let sortedArray = nums.sorted() //[-4,-3,-2,-1,-1,0,0,1,2,3,4] // [-4, -1, -1, 0,1, 2]
//        var resultArray = [[Int]]()
//
////        var first = 0
////        var second = 0
//
//        // loop through 2 elements and equal the value with dic and Its Index
//        // I can make the key is the Number+Index which will allow multiple replication
//        var dic = [Int: [Int]]()
//        for i in  0..<nums.count {
//            if dic[nums[i]] == nil {
//                dic[nums[i]] = []
//                dic[nums[i]]?.append(i)
//            }else {
//                dic[nums[i]]?.append(i)
//
//            }
//        }
//
//        var start = 0
//        var end = start + 1
//        while (start < end) {
//            let sum = nums[start] + nums[end]
//            let targetValue = -sum
//            if let replicantNumbers = dic[targetValue] {
//                for replica in replicantNumbers {
//                    if start == end || start == replica || replica == end {
//                        continue
//                    }
//                        resultArray.append([nums[start], nums[end], nums[replica]])
//                }
//
//            }
//            if  start == nums.count - 2  {
//                break
//            }
//            else if end == nums.count - 1 {
//                start += 1
//                end = start + 1
//            } else {
//                end += 1
//            }
//        }
//        for var arr in resultArray {
//            arr = arr.sorted()
//        }
//
//        resultArray = resultArray.map { $0.sorted()}
//        resultArray = Array(Set(resultArray))
//
        let nums = [-1,0,1,2,-1,-4]
        var resultArray = [[Int]]()
               if nums.count < 3 {
               }
               var allZeros = true
                nums.forEach { element in
                    if element != 0 {
                        allZeros = false
                       }
       }
               if allZeros {
//                   return [[0,0,0]]
               }
       //        var first = 0
       //        var second = 0

               // loop through 2 elements and equal the value with dic and Its Index
               // I can make the key is the Number+Index which will allow multiple replication
               var dic = [Int: [Int]]()
               for i in  0..<nums.count {
                   if dic[nums[i]] == nil {
                       dic[nums[i]] = []
                       dic[nums[i]]?.append(i)
                   }else {
                       dic[nums[i]]?.append(i)
                       
                   }
               }
               
               var start = 0
               var end = start + 1
               while (start < end) {
                   let sum = nums[start] + nums[end]
                   let targetValue = -sum
                   if let replicantNumbers = dic[targetValue] {
                       for replica in replicantNumbers {
                           if start == end || start == replica || replica == end {
                               continue
                           }
                           let tempoArr = [nums[start], nums[end], nums[replica]].sorted {$0 < $1}
                           resultArray.append(tempoArr)
                           resultArray = Array(Set(resultArray))
                               // resultArray.append([nums[start], nums[end], nums[replica]])
                       }
                      
                   }
                   if  start == nums.count - 2  {
                       break
                   }
                   else if end == nums.count - 1 {
                       start += 1
                       end = start + 1
                   } else {
                       end += 1
                   }
               }
         
               
               // resultArray = resultArray.map { $0.sorted()}
               // resultArray = Array(Set(resultArray))
               
//               return resultArray
        XCTAssertEqual(resultArray, [[-5,1,4],[-4,0,4],[-4,1,3],[-2,-2,4],[-2,1,1],[0,0,0]])
        
        //[[-4,0,4],[-4,1,3],[-3,-1,4],[-3,0,3],[-3,1,2],[-2,-1,3],[-2,0,2],[-1,-1,2],[-1,0,1]]

    }
    
    func test_equalSets()  {
            let set1 = Set([1,2,3,4])
            let set2 = Set([4,3,2,1])
        XCTAssertEqual(set1, set2)
    }
    
//    for let arr in resultArray {
//        if arr.contains(sortedArray[start]) && arr.contains(sortedArray[end]) && arr.contains(sortedArray[replica]) {
//            notExist = false
//            break
//        }
//    }
    //    for var arr in resultArray {
    //        if arr.contains(sortedArray[start]) {
    //            arr = arr.filter {$0 != sortedArray[start]}
    //            if arr.contains(sortedArray[end]) {
    //                arr = arr.filter {$0 != sortedArray[end]}
    //                if arr.contains(sortedArray[replica]) {
    //                    arr = arr.filter {$0 != sortedArray[replica]}
    //                    notExist = false
    //                }
    //            }
    //
    //        }
    //
    //    }
    
    func test_sumTriplets_shouldEqualTheTarget() {
        let target = 0
        let arr = [0,0,0]//[-1,0,1,2,-1,-4,-2,-3,3,0,4]//[0,0,0]//[-1,0,1,2,-1,-4] // [-2,0,1,1,2]//
        let sortedArray = arr.sorted() //[-4,-3,-2,-1,-1,0,0,1,2,3,4] // [-4, -1, -1, 0,1, 2]
        var resultArray = [[Int]]()
        var first = 0
        var second = first + 1
        var third = second + 1
        
        while (first < sortedArray.count - 2) {
            let sum = sortedArray[first] + sortedArray[second] + sortedArray[third]
            print("first \(first) second \(second) third \(third)")
            if sum == target  {
                if first == second || first == third || second == third {
                    if second == third {
                        first += 1
                        second = first + 1
                        third = second + 1
                    }
                    continue
                }
                resultArray.append([sortedArray[first], sortedArray[second], sortedArray[third]])
                if third < sortedArray.count - 1 {
                    third += 1
                } else if second < third && third <= sortedArray.count - 1 {
                    second += 1
                    if second < sortedArray.count - 1 {
                    third = second + 1
                    }
                } else {
                    first += 1
                    second = first + 1
                    third = second + 1
                }
            } else if sum < target  {
                if third < sortedArray.count - 1 {
                    third += 1
                } else if second < third && third <= sortedArray.count - 1 {
                    second += 1
                    if second < sortedArray.count - 1 {
                    third = second + 1
                    }
                } else {
                    first += 1
                    second = first + 1
                    third = second + 1
                    continue
                }
            }
            else  {
                if second < third && third <= sortedArray.count - 1 {
                    second += 1

                    if second < sortedArray.count - 1 {
                    third = second + 1
                    }
                } else {
                first += 1
                second = first + 1
                third = second + 1
                continue
                }
            }
        }
        resultArray = Array(Set(resultArray))
        XCTAssertEqual(resultArray, [[-4,0,4],[-4,1,3],[-3,-1,4],[-3,0,3],[-3,1,2],[-2,-1,3],[-2,0,2],[-1,-1,2],[-1,0,1]])
    }

}
//[[-4, 0, 4], [-4, 1, 3], [-3, -1, 4], [-3, 0, 3], [-2, -1, 3], [-1, -1, 2], [-1, 0, 1]]
// [[-4,0,4],[-4,1,3],[-3,-1,4],[-3,0,3],[-3,1,2],[-2,-1,3],[-2,0,2],[-1,-1,2],[-1,0,1]]
