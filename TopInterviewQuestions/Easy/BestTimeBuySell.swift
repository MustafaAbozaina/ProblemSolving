//
//  File.swift
//  TopInterviewQuestions
//
//  Created by mustafa salah eldin on 12/20/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

let prices = [10000, 9999, 9998, 9997, 9996, 9995, 9994, 9993,9992,9991,9990,9989,9988,9987,9986,9985,9984,9983,9982,9981,9980,9979,9978,9977,9976,9975,9974,9973,9972,9971,9970,9969,9968,9967,9966,9965,9964,9963,9962,9961,9960,9959,9958,9957,9956,9955,9954,9953,9952,9951,9950,9949,9948,9947,9946,9945,9944,9943,9942,9941,9940,9939,9938,9937,9936,9935,9934,9933,9932,9931,9930,9929,9928,9927,9926,9925,9924,9923,9922,9921,9920,9919,9918,9917,9916,9915,9914,9913,9912,9911,9910,9909,9908,9907,9906,9905,9904,9903,9902,9901,9900,9899,9898,9897,9896,9895,9894,9893,9892,9891,9890,9889,9888,9887,9886,9885,9884,9883,9882,9881,9880,9879,9878,9877,9876,9875,9874,9873,9872,9871,9870,9869,9868,9867,9866,9865,9864,9863,9862,9861,9860,9859,9858,9857,9856,9855,9854,9853,9852,9851,9850,9849,9848,9847,9846,9845,9844,9843,9842,9841,9840,9839,9838,9837,9836,9835,9834,9833,9832,9831,9830,9829,9828,9827,9826,9825,9824,9823,9822,9821,9820,9819,9818,9817,9816,9815,9814,9813,9812,9811,9810,9809,9808,9807,9806,9805,9804,9803,9802,9801,5,8,3,2,1]


class BestTimeBuySell: XCTestCase {
    
    func test() {

        let a = maxProfit(prices)
        XCTAssertEqual(a, 3)
    }
    
    func maxProfit(_ prices: [Int]) -> Int {

        var mutablePrices = [Int]() // should be optimized for memory
        var startingPricesIndex = 0
        var isDescendingOrdered = true
            for i in 1..<prices.count {
                if prices[i] > prices[i-1] {
                    isDescendingOrdered = false
                    startingPricesIndex = i - 1
                    break
                }
            }
        let arrBuffer = 3
        mutablePrices.reserveCapacity(prices.count-startingPricesIndex + arrBuffer)
        for i in startingPricesIndex..<prices.count {
            mutablePrices.append(prices[i])
        }
        for i in 1..<mutablePrices.count {
            if prices[i] < prices[i-1] {
                if i > 2 {
                    mutablePrices = mutablePrices.dropLast(i - 2)
                    
                }
            }
        }
        
        debugPrint("mutablePrice \(mutablePrices.count)")
            if isDescendingOrdered {
                return 0
            }
            
            // [7,1,5,3,6,4]
            // search for max
            let firstPrice = mutablePrices.first ?? 0
            var firstDifference = 0
            var secondDifference = 0
            var max = 1
            var min = firstPrice
            var indexOfMax = 0
            var indexOfMin = 0

            var maxAndIndex = getMax(values: mutablePrices, startingIndex: 0)
            max = maxAndIndex.max
            indexOfMax = maxAndIndex.index

             if indexOfMax == 0 {
                maxAndIndex = getMax(values: mutablePrices, startingIndex: 1)
                max = maxAndIndex.max
                indexOfMax = maxAndIndex.index
                print("max and index \(max) \(indexOfMax)")
            }
            
            var minAndIndex = getMin(values: mutablePrices, endingIndex: indexOfMax)
            min = minAndIndex.min
            indexOfMin = minAndIndex.index
            print("min is \(min)")
            firstDifference = abs(max - min)
            
            if  min > max {
               firstDifference = 0
            }

           // search for the min
            max = 1
            min = firstPrice
            indexOfMin = 0
            
            minAndIndex = getMin(values: mutablePrices, endingIndex: mutablePrices.count)

            min = minAndIndex.min
            indexOfMin = minAndIndex.index

            if indexOfMin == mutablePrices.count - 1 {
                minAndIndex = getMin(values: mutablePrices, endingIndex: mutablePrices.count - 1)
            min = minAndIndex.min
            indexOfMin = minAndIndex.index
            }
           
            maxAndIndex = getMax(values: mutablePrices, startingIndex: indexOfMin)
            max = maxAndIndex.max

            debugPrint("index min", indexOfMin)
            debugPrint("max", max)
            
            secondDifference = abs(max - min)
            
            debugPrint("first differnece \(firstDifference) second difference \(secondDifference)")
            
            return firstDifference > secondDifference ? firstDifference : secondDifference
        }

        func getMax(values: [Int], startingIndex: Int) -> (max: Int, index: Int) {
            var max = 0
            var indexOfMax = 0
            for i in startingIndex..<values.count {
                if values[i] > max {
                    max = values[i]
                    indexOfMax = i
                }
            }
            return (max, indexOfMax)
        }

        func getMin(values: [Int], endingIndex: Int) -> (min: Int, index: Int) {
            var min = values.first ?? 0
            var indexOfMin = 0
            for i in 0..<endingIndex  {
                if values[i] < min {
                    min = values[i]
                    indexOfMin = i
                }
            }
            return (min, indexOfMin)
        }
}


/*
 var prices = prices

    var isDescendingOrdered = true
       for i in 1..<prices.count {
           if prices[i] > prices[i-1] {
               isDescendingOrdered = false
               break
           }
       }
       
       if isDescendingOrdered {
           return 0
       }
       
       // [7,1,5,3,6,4]
       // search for max
       let firstPrice = prices.first ?? 0
       var firstDifference = 0
       var secondDifference = 0
       var max = 1
       var min = firstPrice
       var indexOfMax = 0
       var indexOfMin = 0

       var maxAndIndex = getMax(values: prices, startingIndex: 0)
       max = maxAndIndex.max
       indexOfMax = maxAndIndex.index

        if indexOfMax == 0 {
           maxAndIndex = getMax(values: prices, startingIndex: 1)
           max = maxAndIndex.max
           indexOfMax = maxAndIndex.index
           print("max and index \(max) \(indexOfMax)")
       }
       
       var minAndIndex = getMin(values: prices, endingIndex: indexOfMax)
       min = minAndIndex.min
       indexOfMin = minAndIndex.index
       print("min is \(min)")
       firstDifference = abs(max - min)
       
       if  min > max {
          firstDifference = 0
       }

      // search for the min
       max = 1
       min = firstPrice
       indexOfMin = 0
       
       minAndIndex = getMin(values: prices, endingIndex: prices.count)

       min = minAndIndex.min
       indexOfMin = minAndIndex.index

       if indexOfMin == prices.count - 1 {
           minAndIndex = getMin(values: prices, endingIndex: prices.count - 1)
       min = minAndIndex.min
       indexOfMin = minAndIndex.index
       }
      
       maxAndIndex = getMax(values: prices, startingIndex: indexOfMin)
       max = maxAndIndex.max

       debugPrint("index min", indexOfMin)
       debugPrint("max", max)
       
       secondDifference = abs(max - min)
       
       debugPrint("first differnece \(firstDifference) second difference \(secondDifference)")
       
       return firstDifference > secondDifference ? firstDifference : secondDifference
   }

   func getMax(values: [Int], startingIndex: Int) -> (max: Int, index: Int) {
       var max = 0
       var indexOfMax = 0
       for i in startingIndex..<values.count {
           if values[i] > max {
               max = values[i]
               indexOfMax = i
           }
       }
       return (max, indexOfMax)
   }

   func getMin(values: [Int], endingIndex: Int) -> (min: Int, index: Int) {
       var min = values.first ?? 0
       var indexOfMin = 0
       for i in 0..<endingIndex  {
           if values[i] < min {
               min = values[i]
               indexOfMin = i
           }
       }
       return (min, indexOfMin)
   }
 */



///Analysis
///
 // To find best profit we should get the maximum difference with constraints

// constraints -> the min value should be before max

// I need to take min and max values
// cases
/*
1- min value in the begining and the max at the end  // the difference will be ok
2- min at the end and the max in the middle // the difference should be with another element unlike the least one  like [2,3,4,1] // the solution should be 4-2
SuggestedSolutionForThisCase = loop through loop get the max and loop again to get the differnce
the problem here, we could face the problem of max ordering It could be at the beginning
=> So we should solve the probelm of ordering because the solution highly depend on It
example: [4,2,3,1] // If we chosen the 4 as max the operation won't
// So what about checking about the max and If we found that the max behind the min, here we should either use another max or another min
if the condition of max before min we could convert the max to -1 and try to find another max and making same checking with It
the problem will be in the min It could be at last element
3- Min at the end and the max at the beginning

[1,2,3,4]
// IF WE Followed that we seaerch for min and after finding It we get the max that lay after Its index would solve It
[4,3,2,1]
// we find the min and try to find the max that lay before It won't work here because in this case It would take o(n2) because first time we will find 1 then 2 then 3 then 4 with each time we get another loop
so to solve this case we could have a loop at the beginning checking if the array ordered decreasingly
the case that contain two elements in the middle, they aren't niether max nor min
[4,2,3,1]
if we found the min and check the max after It, we find the 1 check after It, won't find elments
make It -1 and search for min after It search for max

[4, 2, 5, 1, 3] // this case will break the rule
suggested =? if we get the max and try to delete the min elments from It so If we get 5 and try to delete from 1 so we will find that 1 after Its index, If we search for the second min It will find 2 before max 5 It will work
I think this solution will solve both scenarios
Just need to make sure that the max should be updated to not be at the begining


What I've reached to now
1- I'm searching for the max
2- search for the min before It

and
1- Search for the Min
2- search for the max after It

and compare two outputs with each other and return the greater one

*/
