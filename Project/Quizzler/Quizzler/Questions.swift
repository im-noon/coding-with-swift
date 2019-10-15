//
//  Questions.swift
//  Quizzler
//
//  Created by Slimn Srarena on 13/9/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import Foundation

class Questions {
    
    // properties
    let questionText : String
    let answer : Bool
    
    // initial
    init(text : String, correctAnswer : Bool) {
        questionText = text;
        answer = correctAnswer;
    }
}
