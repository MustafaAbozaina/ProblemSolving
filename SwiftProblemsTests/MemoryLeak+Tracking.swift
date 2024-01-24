//
//  SwiftProblemsTests.swift
//  SwiftProblemsTests
//
//  Created by Mustafa Abozaina on 21/01/2023.
//  Copyright © 2023 Mustafa Abozaina. All rights reserved.
//

import XCTest

extension XCTestCase {
    func trackMemoryLeak(instance: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated", file: file, line: line)
        }
    }
}
