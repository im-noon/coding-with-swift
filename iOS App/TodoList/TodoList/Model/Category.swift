//
//  Category.swift
//  TodoList
//
//  Created by Slimn Srarena on 5/10/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    let items = List<Item>()
    @objc dynamic var name : String = ""
    @objc dynamic var color : String = ""
    
}
