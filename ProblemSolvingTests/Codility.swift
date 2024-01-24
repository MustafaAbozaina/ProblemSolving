//
//  Codility.swift
//  ProblemSolvingTests
//
//  Created by mustafa salah eldin on 3/15/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

class Codility: XCTestCase {
    
    func test_XA() {
        var objXa = XA(xb: "Turing")
        print(XA.xa)
        objXa.xb = "swift"
        print(XA.xa)
        let obje = XA(xb: "quiz")
        print(XA.xa)

    }
    
    func test_ssa() {
        var code = 200
        let result: Result<Int, Error> = .success(code)
        code = 404
        switch (result) {
        case .success(code):
            print(code)
        case .failure(_):
            print("403")
        default:
            print("500")
        }
    }
    
    func  test_enum() {
        var y: Int? = nil
        y? = 5
        print("y\(y)")
    }
    
//    func test_codility() {
//        var people =  [4,4,2,4] // [2,3,4,2]
//        var seats =  [5,5,2,5] // [2,5,7,2]
//        let s = solution(&people, &seats)
//
//        XCTAssertEqual(s, 3)
//
//    }
    
//    func test_pollution() {
//        var arr = [5,19,8,1]
//        arr = arr.sorted()
//        arr = arr.reversed()
//        let sum = arr.reduce(0, +)
//        var sumAfterFilter = sum
//        var filtersCount = 0
//        for e in arr {
//            let a = e / 2
//            sumAfterFilter -= a
//            filtersCount += 1
//            if (sumAfterFilter < (sum / 2)) {
//                break
//            }
//        }
//        var sub = 0
//        for b in arr {
//            if b > 15 {
//                sub -= 1
//            }
//        }
//        filtersCount -= sub
//        return filtersCount
//
//        XCTAssertEqual(filtersCount, 3)
//        XCTAssertLessThan(sumAfterFilter, sum/2)
//
//
//        XCTAssertEqual(arr, [8,6,5,4])
//        XCTAssertEqual(sum, 23)
//    }
//
    
    func test_ss() {
        let number: String? = "most1afa"
        let result = number.flatMap { Int($0) }
//        doSome()
//        doInt()
        declartive()
    }
    
    func declartive() {
        let years = [15,2,67,4,5]
        let sum = years.filter({$0 < 10}).map({$0 * 2}).reduce(5, +)
        print("sum \(sum)")
    }
    
    func doSome() {
        defer {print("a")}
        defer {print("b")}
        defer {print("c")}
        
        print("d")
    }
    
    func doInt() {
        let num = UInt.min
        print("min \(num)")
    }
}


public func solution(_ P : inout [Int], _ S : inout [Int]) -> Int {
    var i = 0
    while i < P.count {
        for j in 0..<S.count {
            // is place exist
            if !(i < P.count) {
                break
            }
            if S[j] > 0 {
                
                if P[i] <= S[j] {
                    P.remove(at: i)
                    i += 1
                    continue
                } else {
                    P[i] -= S[j]
                    S[j] = 0
                    continue
                }
                
            } else {
                i += 1
                continue
            }
        }
    }
    
    
    return P.count
}

//public func solution(_ message : String, _ K : Int) -> [String] {
//    let array = message.components(separatedBy: " ")
//    var newArray = [String]()
//    var currentLimit = 0
//    for a in array {
//        currentLimit += a.count
//        if currentLimit <= K {
//            newArray.append(a)
//            currentLimit += 1
//        }else {
//            break
//        }
//    }
//    return newArray
//}


//public func solution(_ message : inout String, _ K : Int) -> String {
//    let stringArray = message.components(separatedBy: " ")
//    var newTargetArray = [String]()
//    var currentLimit = 0
//    for s in stringArray {
//        currentLimit += s.count
//        if currentLimit <= K {
//            newTargetArray.append(s)
//            currentLimit += 1
//        }else {
//            break
//        }
//    }
//    return newTargetArray.map { String($0) }.joined(separator: " ")
//}


struct XA {
    static var xa = "Advanced"
    var xb: String {
        didSet {
            XA.xa = oldValue
        }
    }
}


class StarShip {
    var type: String = "SS"
    

}

