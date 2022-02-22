//
//  TimeConversion.swift
//  ConsoleProblemSolving
//
//  Created by mustafa salah eldin on 2/10/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import Foundation

func timeConversion()  -> String {
     // remove :
    var time = "12:45:54PM"
    var hours = time.getSubString(fromIndex: 0, toIncludedIndex: 1)
    let isMorning = time.suffix(2).lowercased() == "am"
    time.deleteSubString(fromIndex: time.count - 2, toIndex: time.count)
    if (isMorning && hours != "12") {
        print(time)
        return time
    }
    if (!isMorning && hours != "12") {
        hours = "\((Int(hours) ?? 0) + 12)"
    }
    else if (hours == "12" && isMorning) {
        hours = "00"
    }
    time.removeSubrange(time.getRange(fromIndex: 0, toIndex: 2))
    time = hours + time
    print(time)
    return time
}

