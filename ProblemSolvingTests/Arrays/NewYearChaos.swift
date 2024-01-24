//
//  NewYearChaos.swift
//  ProblemSolvingTests
//
//  Created by mustafa salah eldin on 4/3/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

class NewYearChaos: XCTestCase {

    
    
    func test_chaos() {
//        let q =   [1,2,3,6,7,8,5,4] // // [4,1,2,3]
        let q = [1,2,5,3,7,8,6,4]
        var numberOfBribes = 0
        for i in 0..<q.count {
            let moves = q[i] - (i + 1)
            if moves > 0 {
            if moves > 2 {
                // for short becaues if I delayed the decision to the end it will loop without any useful
                print("Too chaotic")
                return
            } else {
                numberOfBribes += moves
                }
            } else {
                if q.count > i + 1 {
                    if q[i] > q[i + 1] {
                        numberOfBribes += 1
                    }
                }
            }
        }
        print(numberOfBribes)
    }
    
    
}

//[1,2,3,4,5,6,7,8]
//[1,2,3,6,4,5,7,8] // 2
//[1,2,3,6,7,4,5,8] // 2
//[1,2,3,6,7,5,4,8] // 1
//[1,2,3,6,7,8,5,4] // 2

// this method solve the problem but failed in some time cases
func findBirbesfrom(q:[Int]) {
        var array = q
        var numberOfBribes = 0

        for i in 0..<q.count - 1 {
            if q[i] - (i+1) > 2 {
                print("Too chaotic")
                return
            }
        }
        
        for i in 0..<array.count {
            
            if array[i] > (i + 1) {
                let shouldBeCurrentElement = i + 1
                for j in i..<array.count {
                    if shouldBeCurrentElement == array[j]{
                        array.insert(i + 1, at: i)
                        array.remove(at: j + 1 )
                        break
                    }
                    numberOfBribes += 1
                }
            }
        }
        print(numberOfBribes)
    }


// This method solve all test cases 
func bribes(q:[Int]){ //
    var array = q
    var numberOfBribes = 0

    for i in (0..<q.count).reversed() {
        if array[i] - (i + 1) > 2 {
            print("Too chaotic")
            return
        }
        
        if array[i] != i + 1 {
            if (i - 1 >= 0) && (i + 1 == array[i - 1]) {
                numberOfBribes += 1
                array.swapAt(i, i - 1)
            }else if (i - 2 >= 0) && i + 1 == array[i - 2] {
                numberOfBribes += 2
                array[i - 2] = array[i - 1];
                array[i - 1] = array[i];
                array[i] = i + 1;
            }
            
        }

    }
    print(numberOfBribes)
}
