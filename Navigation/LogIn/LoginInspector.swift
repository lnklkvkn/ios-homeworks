//
//  LoginInspector.swift
//  Navigation
//
//  Created by ln on 10.04.2023.
//

import Foundation

class LoginInspector: LogInViewControllerDelegate {
    
    func delegateCheck(login: String, password: String) -> Bool {
        CheckerService.shared.checkCredentials(withEmail: login, password: password)
        if CheckerService.shared.isAutorised {
            return true
        } else {
            return false
        }
    }
    
    func delegateSignIn(login: String, password: String) {
        CheckerService.shared.signUp(withEmail: login, password: password)
    }
    
}
