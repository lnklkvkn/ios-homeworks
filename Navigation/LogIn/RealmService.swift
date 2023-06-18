//
//  RealmService.swift
//  Navigation
//
//  Created by ln on 18.06.2023.
//

import Foundation
import RealmSwift

final class LoginRealmModel: Object {
    
    @objc dynamic var login = ""
    @objc dynamic var password = ""
}

protocol RealmService: AnyObject {}

final class RealmServiceImp {}

extension RealmServiceImp: RealmService {
    
    func signUp(login: String, password: String) -> Bool {
        
        let realm = try! Realm()
        let credentials = LoginRealmModel()
        credentials.login = login
        credentials.password = password
        
        if realm.objects(LoginRealmModel.self).filter({ $0.login == login}).count == 0 {
            try! realm.write {
                realm.add(credentials)
            }
            return true
        } else {
            return false
        }
    }
    
    func checkCredentials(login: String, password: String) -> Bool {
        
        let realm = try! Realm()
        let credentials = LoginRealmModel()
        credentials.login = login
        credentials.password = password
        
        if realm.objects(LoginRealmModel.self).filter({ $0.login == login && $0.password == password}).count > 0 {
            return true
        } else {
            return false
        }
    }
}
