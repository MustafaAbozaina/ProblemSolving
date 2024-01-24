//
//  MinimumCoins.swift
//  GreedyAlgorithms
//
//  Created by mustafa salah eldin on 10/23/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest


class MinimumCoinsTests: XCTestCase {
    let coins = [ 5, 2, 1] //20, 15, 10,
    let expectedCoins = 101
    
    func test_minimumCoins() {
        let s  = ""
        let a  = s.contains("")
        XCTAssertEqual(minimumCoins(coins: coins, target: 501), expectedCoins)
    }
    
    func test_minimumCoinsOptimized() {

        XCTAssertEqual(minimumCoinsOptimized(coins: coins, target: 501), expectedCoins)
    }
    
    func test_minimumCoinsOptimized1() {
        XCTAssertEqual(minimumCoinsOptimized1(coins: coins, target: 501), expectedCoins)
    }
    
    func minimumCoins(coins: [Int], target: Int) -> Int {
        var coins = coins
        var sum = 0
        var numberOfCoinsNeeded = 0
        
        coins.sort()
        while (sum < target) {
            for i in (0..<coins.count).reversed() {
                if target - sum >= coins[i] {
                    sum += coins[i]
                    numberOfCoinsNeeded += 1
                    break
                } else {
                    coins.remove(at: i)
                }
            }
        }
        return numberOfCoinsNeeded
    }
    
    func minimumCoinsOptimized(coins: [Int], target: Int) -> Int {
        var coins = coins
        var sum = 0
        var numberOfCoinsNeeded = 0
        
        coins.sort()
        while (sum < target) {
            for i in (0..<coins.count).reversed() {
                if target - sum >= coins[i] {
                    let multi: Int = (target - sum) / coins[i]
                    sum += coins[i] * multi
                    numberOfCoinsNeeded += multi
                    break
                } else {
                    coins.remove(at: i)
                }
            }
        }
        return numberOfCoinsNeeded
    }
    
    func minimumCoinsOptimized1(coins: [Int], target: Int) -> Int {
        var coins = coins
        var sum = 0
        var numberOfCoinsNeeded = 0
        
        coins.sort()
        while (sum < target) {
            for i in (0..<coins.count).reversed() {
                if target - sum >= coins[i] {
                    let multi: Int = (target - sum) / coins[i]
                    sum += coins[i] * multi
                    numberOfCoinsNeeded += multi
                    coins.remove(at: i)
                }
            }
        }
        return numberOfCoinsNeeded
    }
    
}
