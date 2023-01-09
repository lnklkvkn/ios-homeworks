//
//  fabric.swift
//  Navigation
//
//  Created by ln on 09.01.2023.
//

import Foundation

protocol LoginFactory {
    
    func makeLoginInspector() -> LoginInspector
}

struct MyLoginFactory: LoginFactory {
    func makeLoginInspector() -> LoginInspector {
        return LoginInspector()
    }
    
}
