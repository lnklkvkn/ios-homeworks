//
//  UserModel.swift
//  Navigation
//
//  Created by ln on 18.11.2022.
//

import UIKit

public class User {
    
    public var login: String
    var name: String
    var avatar: UIImage
    var status: String
    
    init(login: String, name: String, avatar: UIImage, status: String) {
        self.login = login
        self.name = name
        self.avatar = avatar
        self.status = status
    }
}
