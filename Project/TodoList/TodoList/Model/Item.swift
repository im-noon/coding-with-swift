//
//  Item.swift
//  TodoList
//
//  Created by Slimn Srarena on 5/10/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title : String = ""
    @objc dynamic var done : Bool = false
    @objc dynamic var dateCreated : Date?
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
