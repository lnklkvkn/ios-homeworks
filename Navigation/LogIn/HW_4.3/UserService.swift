//
//  UserService.swift
//  Navigation
//
//  Created by ln on 18.11.2022.
//

import UIKit

protocol UserServiceProtocol {

    func authorization(login: String) -> User?
}

class CurrentUserService : UserServiceProtocol {

    var user = User(login: "cat", name: "Catty Clappy", avatar: (UIImage(named: "cat"))! , status: "He-he-he")
    
    func authorization(login: String) -> User? {
        if login == self.user.login {
            return user
        } else {
            return nil
        }
    }

}

class TestUserService: UserServiceProtocol {
    
    var user = User(login: "man", name: "Mr. Snow", avatar: (UIImage(named: "20"))! , status: "Hello World")
    func authorization(login: String) -> User? {
        if login == self.user.login {
            return user
        } else {
            return nil
        }
    }
    
    
}
