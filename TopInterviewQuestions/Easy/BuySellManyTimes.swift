//
//  BuySellManyTimes.swift
//  TopInterviewQuestions
//
//  Created by mustafa salah eldin on 12/20/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

class BuyAndSellManyTimes: XCTestCase {
    
    func test() {
        let arr1 = [1,2,3,4,5]
        let arr2 = [7,1,5,3,6,4]
        let arr3 = [7,6,4,3,1]
        let result1 = maxProfit(arr1)
        let result2 = maxProfit(arr2)
        let result3 = maxProfit(arr3)
        XCTAssertEqual(result1, 4)
        XCTAssertEqual(result2, 7)
        XCTAssertEqual(result3, 0)
    }
    
    func maxProfit(_ prices: [Int]) -> Int {
        // check of the next 2 elements
        // if the second element less than first element // and the current element is less than both
        // so delete the current from the next
        
        // if the current less than the next but the second next greater than the next, so continue to reach to the first element start goes down
        
        var profit = 0
        var i = 0
        // loop to prices.count - 1 because I compare the element with the next to It
        while i < prices.count - 1 {
            if prices[i] < prices[i+1] {
                let result = getTheMostGreaterOne(index: i+1, arr: prices)
                let returnedElementIndex = result.completeIndex
                profit += abs(prices[i] - prices[returnedElementIndex])
                i = returnedElementIndex
            } else {
                i += 1
            }
            
        }
        
        return profit
    }
    
    // This function is try to find the next greater element so If I find the
    func getTheMostGreaterOne(index: Int, arr: [Int]) -> (greaterElement: Int, completeIndex: Int) {
        for i in index..<arr.count - 1 {
            if arr[i] > arr[i + 1] {
                return (arr[i], i)
            }
            
            if i + 1 == arr.count - 1 {
                return (arr[i + 1], i + 1)
            }
        }
        return (arr[index], index)
    }
    
}
