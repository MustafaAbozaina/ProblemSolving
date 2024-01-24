//
//  BookSeller.swift
//  ProblemSolvingTests
//
//  Created by mustafa salah eldin on 6/20/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

class BookSeller: XCTestCase {
 
    func testExample() {
            let b = ["BBAR 150", "CDXE 515", "BKWR 250", "BTSQ 890", "DRTY 600"]
            let c = ["A", "B", "C", "D"]
            let expectedResult = "(A : 0) - (B : 1290) - (C : 515) - (D : 600)"
        let output = stockList(b, c)
        
        XCTAssertEqual(output, expectedResult)
        }
    
    func stockList(_ listOfArt: [String], _ listOfCat: [String]) -> String {

      var result = ""
      if listOfArt.count == 0 {
        return ""
      }
      var categoriesDic = listOfCat.reduce(into: [String: Int]()) { $0[$1] = 0 }
      for category in listOfCat {
        categoriesDic[category] = 0
      }
      for art in listOfArt {
        let firstCharacter = String(art.first!)
        var bookCount = Int(art.split(separator: " ")[1]) ?? 0
        categoriesDic[firstCharacter] = (categoriesDic[firstCharacter] ?? 0) + bookCount
      }
      
      for cat in listOfCat {
         if result.count > 0 {
          result += " - "
        }
        result += "(\(cat) : \(categoriesDic[cat]!))"
    }
      

      return result
    }

    
    func test2() {
        let n = "56"
        let m = "245769"
        let nDigits = n.compactMap {$0.wholeNumberValue}
        let mDigits = m.compactMap {$0.wholeNumberValue}
        var mDigitsSet = Set(mDigits)
        print("digits \(nDigits)")
        print("mDigits \(mDigitsSet)")

        var numberOfTrueAssumptions = 0
        var formedNumberArr = [Int]()
        var equalNumbers = [Int:Int]()
        equalNumbers = [2:5,5:2,6:9,9:6]
            var outFromSet = false
            while(!outFromSet) {
            
        for number in nDigits {
            if mDigitsSet.contains(number)  {
                formedNumberArr.append(number)
                mDigitsSet.remove(number)
            } else if mDigitsSet.contains(equalNumbers[number] ?? -1) {
                mDigitsSet.remove(equalNumbers[number] ?? -1)
                formedNumberArr.append(equalNumbers[number] ?? -1)
            } else {
                outFromSet = true
            }
        }
        if formedNumberArr.count == nDigits.count {
            numberOfTrueAssumptions += 1
            formedNumberArr = []
        }
        }
        print(numberOfTrueAssumptions)
        
        

    }
}

//
//func race(_ v1: Int, _ v2: Int, _ g: Int) -> [Int]? {
//  // your code
//  // calculate first one speed  v1/3600
//  // calculate second one speed  // v2/3600
//  //  differnce 0.0361 feet per second
//  // cacluate 70 feet -> to know how much time so speed = distance/time so 0.0361 = 70/time so time = 70/0.0361
//  // so time will equal 32.317
//
//  let v1Speed: Float = Float(v1) / 3600.0
//  let v2Speed: Float = Float(v2) / 3600.0
//
//  let v2DifferenceSpeed = v2Speed - v1Speed
//
//  let timeTakeV2ToGoTheLeadDistance = Float(g) / v2DifferenceSpeed
//  debugPrint("time \(timeTakeV2ToGoTheLeadDistance)")
//
//  let seconds:
//  let mintues: Int = timeTakeV2ToGoTheLeadDistance / 60
//  let hourse: Int = mintues / 60
//  return [0,32,18]
//
//    let x = 1.23556789
//    let y = Double(round(1000 * x) / 1000)
//    print(y)
//    let fractionalX:Float = x - Float(integerX)
//}
