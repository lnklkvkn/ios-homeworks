//
//  LogInViewControllerDelegate.swift
//  Navigation
//
//  Created by ln on 08.04.2023.
//

import UIKit

protocol LogInViewControllerDelegate {
    func delegateCheck(login: String, password: String) -> Bool
}
