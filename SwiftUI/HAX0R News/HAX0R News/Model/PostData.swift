//
//  PostData.swift
//  HAX0R News
//
//  Created by Slimn Srarena on 25/10/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import Foundation

struct Results: Decodable {
    let hits : [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
