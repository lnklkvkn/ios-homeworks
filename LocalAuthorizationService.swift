//
//  LocalAuthorizationService.swift
//  Navigation
//
//  Created by ln on 03.07.2023.
//

import UIKit
import LocalAuthentication

//protocol

final class LocalAuthorizationService {
    
    private var canEvaluateBiometrics = false
    private lazy var context = LAContext()
    private let policy = LAPolicy.deviceOwnerAuthentication
    
    func authorizeIfPossible(_ authorizationFinished: @escaping (Bool) -> Void) {
        let context = LAContext()
        let policy = LAPolicy.deviceOwnerAuthentication
        var error: NSError? = nil
        let canEvaluateBiometrics = context.canEvaluatePolicy(policy, error: &error)

        guard canEvaluateBiometrics else {
            print(" Нельзя использовать биометрию")
            return
        }
        context.evaluatePolicy(policy, localizedReason: "Авторизуйся пожалуйста дорогой") { success, error in
            DispatchQueue.main.async {
                if success {
                    authorizationFinished(true)
                } else {
                    authorizationFinished(false)
                    AlertErrorSample.shared.alert(title: "Ошибка регистрации", message: error?.localizedDescription ?? "")
                }
            }
        }
    }
}
