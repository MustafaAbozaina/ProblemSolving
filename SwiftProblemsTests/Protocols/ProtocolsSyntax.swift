//
//  ProtocolsSyntax.swift
//  SwiftProblemsTests
//
//  Created by Mustafa Abozaina on 03/03/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//

import Foundation

protocol MyProtocol1 {
    func myFunction()
}

protocol MyProtocol2 {
    associatedtype MyType
    func myFunction(with value: MyType)
}

protocol MyProtocol3 {
    associatedtype MyType
    func myFunction(with value: MyType)
}

protocol MyProtocol4 {
    func myFunction() -> Self
}

protocol MyProtocol5 where Self: AnyObject {
    func myFunction()
}

protocol MyProtocol6 {
    typealias MyType = Int
    func myFunction(with value: MyType)
}

protocol MyProtocol7 {}
extension MyProtocol7 {
    func myFunction() {}
}
