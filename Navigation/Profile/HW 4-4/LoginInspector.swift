//
//  LoginInspector.swift
//  Navigation
//
//  Created by ln on 15.12.2022.
//

import Foundation

struct LoginInspector: LoginViewControllerDelegate {
    func check(log: String, pass: String) throws -> Bool {
        let a = Checker.shared
        return try a.check(log, pass)
    }
    
    
}
