//
//  EnumTests.swift
//  SwiftProblemsTests
//
//  Created by Mustafa Abozaina on 04/03/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//

import XCTest

final class EnumTests: XCTestCase {

    func test() {
        let statusCode = HTTPStatusCode(rawValue: 404)
        let rawValue = HTTPStatusCode.notFound.rawValue
        
        XCTAssertTrue(statusCode == .notFound)
        XCTAssertEqual(rawValue, 404)
    }

    func calculateArea(shape: Shape) -> Double {
        switch shape {
        case .rectangle(let width, let height):
            return width * height
        case .circle(let radius):
            return Double.pi * radius * radius
        }
    }
   
    func test_associatedValues() {
        let rect = Shape.rectangle(width: 10.0, height: 5.0)
        let circle = Shape.circle(radius: 3.0)

        print(calculateArea(shape: rect)) // prints 50.0
        print(calculateArea(shape: circle)) // prints 28.274333882308138
    }
}


enum Direction {
    case north
    case south
    case east
    case west
    
    var opposite: Direction {
        switch self {
        case .north:
            return .south
        case .south:
            return .north
        case .east:
            return .west
        case .west:
            return .east
        }
    }
    
    func getDescription() -> String {
        switch self {
        case .north:
            return "Heading North"
        case .south:
            return "Heading South"
        case .east:
            return "Heading East"
        case .west:
            return "Heading West"
        }
    }
    
    static func getDirections() -> [Direction] {
        return [.north, .south, .east, .west]
    }
    
    func getCoordinates() -> (x: Int, y: Int) {
        switch self {
        case .north:
            return (0, 1)
        case .south:
            return (0, -1)
        case .east:
            return (1, 0)
        case .west:
            return (-1, 0)
        }
    }
}

enum HTTPStatusCode: Int {
    case success = 200
    case notFound = 404
    case serverError = 500
}

