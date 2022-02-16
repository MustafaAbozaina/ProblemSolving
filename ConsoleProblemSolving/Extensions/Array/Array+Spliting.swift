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
