//
//  ipAdd.swift
//  AlgoLab150Problems
//
//  Created by Mustafa Abozaina on 16/01/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//

import XCTest

final class defangIPAddress: XCTestCase {
    
    func test() {
        let input = "255.100.50.0"
    let expectedOutput = "255[.]100[.]50[.]0"
        XCTAssertEqual(defangIPaddr(input), expectedOutput)
    }

    func defangIPaddr(_ address: String) -> String {
          // Separate the numbers in an array
          
          // start build new string from numbers and add between then [.]
          // reverse the array of numbers to remove numbers from end of array not begining, because removing from begining will cost O(n) whether removing from End will cost O(1)
          // loop through the array of numbers and each iteration remove last element
          var arrayOfStringNumbers = [String]()
          var numberString = ""
          for char in "\(address)." {
              print("char is \(char)")
              if char == "." {
                  arrayOfStringNumbers.append(numberString)
                  numberString = ""
              } else {
                  numberString += "\(char)"
              }
          }
          var result = ""
          // adding without reverse
          for i in 0..<arrayOfStringNumbers.count - 1{
              result += "\(arrayOfStringNumbers[i])[.]"
          }
          result += arrayOfStringNumbers.last ?? ""
          return result
      }
}
