//
//  DummyTests.swift
//  ProblemSolvingTests
//
//  Created by mustafa salah eldin on 3/22/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

class DummyTests: XCTestCase {
    
    func test_chainBusiness() {
        // Business Name format: chain_name, Location, business ID
        // location: last line of entered input
        // input one could contain multiple lines
            
        // target
        // get number of chains corresponding to given location (descending)
        // if the number of multiple unique business on a location is the same, use chain name to sort alphab as a secondary sorting cirtiria
        

        let stringArraySeparated = "age = 51, key=jskdlf, ".components(separatedBy: ",")
        print("all \(stringArraySeparated)")
        let a = stringArraySeparated.filter{($0.contains("age"))}
        var count = 0
        for ab in a {
            let value = ab.components(separatedBy: "=")
            if let v = Int(value[1].replacingOccurrences(of: " ", with: "")) {
                if v >= 50 {
                    count += 1
                }
            }
        }
        print("some \(count)")
    }

    
}
