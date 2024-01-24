//
//  Anagram.swift
//  ProblemSolvingTests
//
//  Created by mustafa salah eldin on 6/15/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

class AnagramStrings: XCTestCase {

    func test_isAngram_shouldBeCorrect() {
      // we can isolate all characters in on array and try to check if they have the same elements
        // Steps
        
        // Convert the two strings into array of Characters
        // Comparing them
        // but If we compared between the both arrays It will have high complexity
        // the solution of that -> we can convert one array into dictionary for O(1) complexity accessing elemnts and iterate through the other one
        //
        
        // this means that I comparing all characters
        // if the same
        // So I should loop through one's element and check each character in the other one so we can convert the second one to set to O(1)
        // problem with set that It won't repeat repeated characters
        // so if first one is typphhooonn and second one is typhonnnnn it will path
        
        
        let firstWord = "nnnnnnyptho"
        let secondWord = "typhonnnnnn"
        let string1Array = Array(firstWord) // Array("typhoon")
        let string2Array = Array(secondWord)
        var string1Dic = [String.Element: Int]()
        var string2Dic = [String.Element: Int]()
        
        
        for e in string1Array {
            string1Dic[e] = (string1Dic[e] ?? 0) + 1
            
        }
        for e in string2Array {
            string2Dic[e] = (string2Dic[e] ?? 0) + 1
        }
        var isAnagram = true
        if string1Dic.keys != string2Dic.keys {
            isAnagram = false
        }
        for (key,value) in string1Dic {
            if let keyValue = string2Dic[key] {
                if value != keyValue {
                    isAnagram = false
                }
            } else {
                isAnagram = false
            }
        }
        XCTAssertTrue(isAnagram)
    }
}



//protocol classa {
//     var no1: Int { get set }
//     func calc(sum: Int)
//}
//
//protocol result {
//     func print(target: classa)
//}
//
//class student2: result {
//       func print(target: classa) {
//              target.calc(sum: 1)
//           }
//}
//class classb: result {
//       func print(target: classa) {
//              target.calc(sum: 5)
//           }
//}
//
//class student: classa {
//       var no1: Int = 10
//
//       func calc(sum: Int) {
//              no1 -= sum
//              print("Student attempted \(no1) times to pass")
//
//              if no1 <= 0 {
//                     print("Student is absent for exam")
//                  }
//           }
//}
//
//class Player {
//       var stmark: result!
//
//       init(stmark: result) {
//              self.stmark = stmark
//           }
//       func print(target: classa) {
//              stmark.print(target: target)
//           }
//}

 
  //   When we run the above program what wil lbe the out put?


//var marks = Player(stmark: student2()) // mark is a player uses result use print and print of student2 uses calc
//   var marksec = student()
//
//marks.print(target: marksec)
//// Player will print uses Student
//// Student not used in Print // because student is the target it just pass to student 2
//// stmark is Student2
//// student2.print(student())  // first output is 9 because we subtract just 1 from 10
////  Student attempted 9 times to pass
//
//    marks.print(target: marksec) // Student attempted 8 times to pass
//    marks.print(target: marksec) // Student attempted 7 times to pass
//
//    marks.stmark = classb()
//// stmark will be of type classB
//// Player will print ClassB
//// ClassB print will
//
//
//    marks.print(target: marksec) // "Student attempted 2 times to pass"
//    marks.print(target: marksec) // "Student attempted -3 times to pass" Student is absent for exam
//    marks.print(target: marksec) // Student attempted -8 times to pass" Student is absent for exam

