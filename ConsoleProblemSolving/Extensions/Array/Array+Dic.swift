//
//  Array+Dic.swift
//  ConsoleProblemSolving
//
//  Created by mustafa salah eldin on 6/12/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import Foundation

extension Array {
    public func toDictionary<Key: Hashable>(with selectKey: (Element) -> Key) -> [Key:Element] {
        var dict = [Key:Element]()
        for element in self {
            dict[selectKey(element)] = element
        }
        return dict
    }
}
