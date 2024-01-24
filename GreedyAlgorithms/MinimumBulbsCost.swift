import XCTest


class MinimumBulbsCost: XCTestCase {
    
    func test_minimum() {
        let arr: [Int8] = [0,1,0,1,1,0,1,1]
        XCTAssertEqual(minimumBulbs(bulbs: arr), 6)
    }
    // Complexity: O(n)
    func minimumBulbs(bulbs: [Int8]) -> Int {
        // cost increases even If one bulb changed
        var cost = 0
        for bulb in bulbs {
            var b = bulb
            if cost % 2 != 0 {
                b = b == 0 ? 1 : 0
            }
            
            if b % 2 != 0 { // This means that It's equal 1
                continue
            } else {
                cost += 1
            }
        }
        
        return cost
    }
}

