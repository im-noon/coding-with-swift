//
//  StructExmple.swift
//  Struct vs Class
//
//  Created by Slimn Srarena on 11/10/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import Foundation

struct StructHero {
    var name : String
    var universe : String
    
    mutating func reversName() {
        self.name = String(self.name.reversed())
    }
}

