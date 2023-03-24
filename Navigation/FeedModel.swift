//
//  FeedModel.swift
//  Navigation
//
//  Created by ln on 09.03.2023.
//

import UIKit

class FeedModel {

    var secretWord = "cat"
    let secretWords = ["snake", "tiger", "dog", "pig", "cow"]
    var isTrue = false
    
    func check(word: String) {
        if word == secretWord {
            isTrue = true
        } else {
            isTrue = false
        }
    }
}

