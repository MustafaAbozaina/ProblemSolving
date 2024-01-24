//
//  StringPeriods.swift
//  ProblemSolvingTests
//
//  Created by mustafa salah eldin on 4/5/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

class StringPeriods: XCTestCase {
    
    func test_periods() {
        
        XCTAssertEqual(stringPeriods(fullString: "ababababa"), "-1") // passed
        
        XCTAssertEqual(stringPeriods(fullString: "abababab"), "abab")


        XCTAssertEqual(stringPeriods(fullString: "abcabc"), "abc")

        XCTAssertEqual(stringPeriods(fullString: "affedaaffedw"), "-1")
        XCTAssertEqual(stringPeriods(fullString: "abcxabcw"), "-1")

        
    }
    
    
    func stringPeriods(fullString: String) -> String{
        if fullString.count % 2 != 0 {
            return "-1"
        }
        var longestSubstring = ""
        var substrings = [String]()
        var repeatedSubStrings = [String]()
        var theSubstring = ""
        for s in fullString {
            theSubstring += String(s)
            substrings.append(theSubstring)
        }
        
        for s in substrings {
            if calculateTheCountRepeated(fullString: fullString, subString: s) > 1 {
                repeatedSubStrings.append(s)
            }
        }
        
        longestSubstring = repeatedSubStrings.reduce(repeatedSubStrings[0]) {$0.count > $1.count ? $0 : $1}
        
        if fullString.count % longestSubstring.count != 0 {
            return "-1"
        }
        
        XCTAssertEqual(calculateTheCountRepeated(fullString: "ababab", subString: "ab"), 3)
        return longestSubstring
    }
    
    func calculateTheCountRepeated(fullString: String, subString: String) -> Int {
        let string: NSString = fullString as NSString
        
        let searchString = subString
        
        var range: NSRange = string.range(of: searchString)
        var count = 0
        while range.location != NSNotFound {
            count += 1
            let searchRange = NSMakeRange(range.location + range.length, string.length - range.length - range.location)
            range = string.range(of: searchString, options: .caseInsensitive, range: searchRange, locale: nil)
            
        }
        return count
        
    }
}
