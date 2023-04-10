//
//  CheckerService.swift
//  Navigation
//
//  Created by ln on 08.04.2023.
//

import UIKit
import Firebase

protocol CheckerServiceProtocol {
    func checkCredentials(withEmail email: String, password: String )
    func signUp(withEmail email: String, password: String )
}


class CheckerService: CheckerServiceProtocol {
    
    static let shared = CheckerService()
    
    var isAutorised = false
    
    func checkCredentials(withEmail email: String, password: String) {
        Auth.auth().signIn(withEmail: email, password: password) { _ , error in
            if let error {
                let err = error as NSError
                switch err.code {
                case AuthErrorCode.userNotFound.rawValue:
                    
                    let alert = UIAlertController(title: "Пользователь не найден", message: "Зарегистрировать новый аккаунт?", preferredStyle: .alert)
                    
                    let firstAction = UIAlertAction(title: "Отмена", style: .default) { _ in
                        print("Отмена регистрации ")
                    }
                    let secondAction = UIAlertAction(title: "Регистрация", style: .default) { _ in
                        print("Зарегистрирован новый пользователь: \(email)")
                        self.signUp(withEmail: email, password: password)
                    }
                    alert.addAction(firstAction)
                    alert.addAction(secondAction)
                    UIApplication.topViewController()!.present(alert, animated: true)
                default:
                    AlertErrorSample.shared.alert(title: "Ошибка входа", message: error.localizedDescription)

                }
            } else {
                self.isAutorised = true
            }
        }
    }
    
    func signUp(withEmail email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { _ , error in
            if let error {
                AlertErrorSample.shared.alert(title: "Ошибка регистрации", message: error.localizedDescription)
            } else {
                AlertErrorSample.shared.alert(title: "Успешная регистрация", message: "Ваш аккаунт создан!")
            }
        }
    }
}
