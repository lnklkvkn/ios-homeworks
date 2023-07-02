//
//  SixthViewController.swift
//  Navigation
//
//  Created by ln on 16.08.2022.
//

import UIKit
import UserNotifications
import UserNotificationsUI

class FeedViewController: UIViewController {
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var firstButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
        button.setTitle("Показать пост", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var secondButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
        button.setTitle("Показать пост", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private func stackViewContraints() -> [NSLayoutConstraint] {
        let centerXConstraint = self.stackView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        let centerYConstraint = self.stackView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)

        return [
            centerXConstraint, centerYConstraint
        ]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        stackView.center = view.center
        self.view.addSubview(self.stackView)
        
        self.stackView.addArrangedSubview(self.firstButton)
        self.stackView.addArrangedSubview(self.secondButton)
        NSLayoutConstraint.activate(stackViewContraints())
    }
    
    @objc private func didTapButton() {        
    
        let vc = PostViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}

var post = PostTitle(title: "My post!")
