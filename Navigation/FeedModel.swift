//
//  FeedModel.swift
//  Navigation
//
//  Created by ln on 09.03.2023.
//

import UIKit

class FeedModel {
    
    let secretWord = "cat"
    var isTrue = false
    
    func check(word: String) {
        if word == secretWord {
            isTrue = true
        }
    }
}

