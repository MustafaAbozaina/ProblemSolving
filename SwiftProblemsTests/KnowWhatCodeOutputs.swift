//
//  KnowWhatCodeOutputs.swift
//  SwiftProblemsTests
//
//  Created by Mustafa Abozaina on 22/01/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//

import XCTest

protocol ClassA {
   var no1: Int { get set }
   func calc(sum: Int)
}
protocol result {
   func print(target: ClassA)
}
class student2: result {
   func print(target: ClassA) {
      target.calc(sum: 1)
   }
}
class ClassB: result {
   func print(target: ClassA) {
      target.calc(sum: 5)
   }
}

class student: ClassA {
   var no1: Int = 10
   
   func calc(sum: Int) {
      no1 -= sum
      print("Student attempted \(sum) times to pass")
         
      if no1 <= 0 {
         print("Student is absent for exam \(no1)")
      }
   }
}

class Player {
   var stmark: result!

   init(stmark: result) {
      self.stmark = stmark
   }
   func print(target: ClassA) {
      stmark.print(target: target)
   }
}



class WhatCodeOutputTests: XCTestCase {
    
  
}
