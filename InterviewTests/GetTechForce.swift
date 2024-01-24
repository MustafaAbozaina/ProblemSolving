//
//  GetTechForce.swift
//  InterviewTests
//
//  Created by mustafa salah eldin on 12/9/22.
//  Copyright © 2022 Mustafa Abozaina. All rights reserved.
//

import XCTest

class GetTechForceTests: XCTestCase {
    
}

public enum AlreadyHatchedError: Error {
    case alreadyHatched
}

public protocol Reptile {
    func lay() -> ReptileEgg
}

public class FireDragon: Reptile {
    public func lay() -> ReptileEgg {
        let fireDragon = FireDragon()
        let retpileEgg = ReptileEgg {
          return fireDragon
        }
        return retpileEgg
    }
}

public class ReptileEgg {
    var reptile: Reptile
    var hatchCount = 0
    public init(createReptile: @escaping () -> Reptile) {
        self.reptile =  createReptile()
    }

    public func hatch() throws -> Reptile {
        if self.hatchCount == 0 {
            hatchCount = 1
            return reptile
        } else {
            throw AlreadyHatchedError.alreadyHatched

        }
        
    }
}
