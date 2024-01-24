//
//  ProtocolsTests.swift
//  SwiftProblemsTests
//
//  Created by Mustafa Abozaina on 03/03/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//
import Foundation
import XCTest

class ProtocolsTests: XCTestCase {
    func test_associatedTypesProtocols() {
//        let myPro:
    }
}

protocol ViewModelProtocol {
    associatedtype DataType
    var data: DataType { get set }
}

//class MyViewController: UIViewController {
//    var viewModel: ViewModelProtocol?
//
//    func configure(with viewModel: ViewModelProtocol) {
//        self.viewModel = viewModel
//        self.viewModel?.data = "Hello World"
//    }
//}
protocol ViewModelProtocol1 {
    associatedtype Data
    func processData(_ data: Data)
}

class ABCS<T>: ViewModelProtocol1 {
    func processData(_ data: T) {
        
    }
    
    typealias Data = T
    
}


struct Struct1<T: A>: MyProtocolWithAssociated {
    func doSomething(with value: T) {
        
    }
    
    typealias MyType = T
}

class A {
    
}

protocol MyProtocolWithAssociated {
    associatedtype MyType
    
    func doSomething(with value: MyType)
}
