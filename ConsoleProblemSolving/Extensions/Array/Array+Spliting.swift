//
//  Array+Spliting.swift
//  ConsoleProblemSolving
//
//  Created by mustafa salah eldin on 2/12/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import Foundation

extension Array {
    func split() -> (left: [Element], right: [Element]) {
        let ct = self.count
        let half = ct / 2
        let leftSplit = self[0 ..< half]
        let rightSplit = self[half ..< ct]
        return (left: Array(leftSplit), right: Array(rightSplit))
    }
}



extension Array {
    func split(leftLastIndex: Int) -> (left: [Element], right: [Element]) {
        let leftArr = self[0 ..< leftLastIndex]
        let rightArr = self[leftLastIndex ..< self.count]
        return (left: Array(leftArr), right: Array(rightArr))
    }
}
