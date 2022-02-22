//
//  String+Substrings.swift
//  ConsoleProblemSolving
//
//  Created by mustafa salah eldin on 2/18/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import Foundation

extension String {
    func getSubString(fromIndex: Int, toIncludedIndex: Int) -> Substring {
        if self.count <= toIncludedIndex {
            return ""
        }
        let start = self.index(self.startIndex, offsetBy: fromIndex)
        let end = self.index(self.startIndex, offsetBy: toIncludedIndex)
        
        let range = start...end
        
        return self[range]
    }
}

extension String {
    func getRange(fromIndex: Int, toIndex: Int) -> Range<Index> {
        let endIndex = self.index(self.startIndex, offsetBy: toIndex)
        let range = self.index(self.startIndex, offsetBy: fromIndex)..<endIndex
       return range
    }
}

extension String {
    mutating func deleteSubString(fromIndex: Int, toIndex: Int) {
        let endIndex = self.index(self.startIndex, offsetBy: toIndex)
        let range = self.index(self.startIndex, offsetBy: fromIndex)..<endIndex
        self.removeSubrange(range)
    }
}
