//
//  Checker.swift
//  Navigation
//
//  Created by ln on 15.12.2022.
//

import UIKit


enum LoginError: Error {
    case incorrectPassword
    case userIsNotFound
}

final class Checker {
    
    static let shared = Checker()
    
    private init() {}
    
    private let login = "cat"
    private let password = "cat"
    

    
    func check(_ log: String, _ pass: String) throws -> Bool {
        
        if log == self.login && pass == self.password {
            return true
        } else if log == self.login && pass != self.password {
            throw LoginError.incorrectPassword
        } else {
            throw LoginError.userIsNotFound
        }
    }
}

protocol LoginViewControllerDelegate {
    
    func check(log: String, pass: String) throws -> Bool
}
