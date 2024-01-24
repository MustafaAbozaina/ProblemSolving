//
//  File.swift
//  AlgoLab150Problems
//
//  Created by Mustafa Abozaina on 15/02/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//

import XCTest

//10. Richest Customer Wealth: https://leetcode.com/problems/richest-customer-wealth
class RichestCustomerWealthTests: XCTestCase {
    
    func test() {
        XCTAssertEqual(maximumWealth([[1,2,3],[3,2,1]]), 6)
    }
    
    func maximumWealth(_ accounts: [[Int]]) -> Int {
        // I should stop on i and get all J for It
        var accountsValues = Array(repeating: 0, count: accounts.count)
        // accountsValues.reserveCapacity(accounts.count)
        for i in 0..<accounts.count {
            for j in 0..<accounts[i].count {
                accountsValues[i] += accounts[i][j]
            }
        }
        
        return accountsValues.max() ?? 0
    }
    
    func maximumWealthOptimized(_ accounts: [[Int]]) -> Int {
        // I should stop on i and get all J for It
        var maxAccount = 0
        for i in 0..<accounts.count {
            var tempMaxAccount = 0
            for j in 0..<accounts[i].count {
                tempMaxAccount += accounts[i][j]
            }
            if tempMaxAccount > maxAccount {
                maxAccount = tempMaxAccount
            }
        }
        
        return maxAccount
    }
}
