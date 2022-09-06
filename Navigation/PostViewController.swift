//
//  EightViewController.swift
//  Navigation
//
//  Created by ln on 16.08.2022.
//

import UIKit

class PostViewController: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemPurple
        self.navigationItem.title = myPost.title
        
        let myButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapButton))
        navigationItem.rightBarButtonItem = myButton
    }
    
    @objc private func didTapButton() {
        let vc = InfoViewController()
        vc.modalPresentationStyle = .automatic
        self.present(vc,animated: true)
    }
    
}

struct Post {
    var title: String
}

var myPost = post

