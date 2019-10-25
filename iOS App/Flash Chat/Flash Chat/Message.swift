//
//  Message.swift
//  Flash Chat
//
//  Created by Slimn Srarena on 17/9/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import Foundation

class Message {

    //TODO: Messages need a messageBody and a sender variable
    var sender: String = ""
    var message: String = ""
    
    init(_ who : String, _ text : String) {
        sender = who
        message = text
    }
}
