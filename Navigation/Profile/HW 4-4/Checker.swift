//
//  Checker.swift
//  Navigation
//
//  Created by ln on 15.12.2022.
//

import UIKit

final class Checker {
    
    static let shared = Checker()
    
    private init() {}
    
    private let login = "cat"
    private let password = "cat"
    
    func check(_ log: String, _ pass: String) -> Bool {

        log == self.login && pass == self.password
    }
}

protocol LoginViewControllerDelegate {
    
    func check(log: String, pass: String) -> Bool
}
