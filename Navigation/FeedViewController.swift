//
//  SixthViewController.swift
//  Navigation
//
//  Created by ln on 16.08.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    private var checkText: String = ""
    let feedModel = FeedModel()
    
    
    
    private lazy var checkTextField : UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 12
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.placeholder = "  Введите слово..."
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(self.checkTextChanged), for: .editingChanged)
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()
    
    @objc private func checkTextChanged(_ textField: UITextField) {
        if feedModel.isTrue {
            indicatorButton.backgroundColor = .green
        } else {
            indicatorButton.backgroundColor = .red
        }
    }
    
   
    private lazy var checkGuessButton = CustomButton(title: "Проверить слово", completion: { [self] in if self.checkTextField.text != nil {
        self.feedModel.check(word: self.checkTextField.text!)}
    })
    
    private lazy var indicatorButton: UILabel = {
        let label = UILabel()
        label.backgroundColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    private lazy var firstButton = CustomButton(title: "Показать пост",
                                                 completion: {
        let vc = PostViewController()
        self.navigationController?.pushViewController(vc, animated: true)}
    )
    private lazy var secondButton = CustomButton(title: "Показать пост",
                                                 completion: {
        let vc = PostViewController()
        self.navigationController?.pushViewController(vc, animated: true)}
    )
    
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
        
        NSLayoutConstraint.activate([
            
            checkTextField.topAnchor.constraint(equalTo: self.view.topAnchor),
            checkTextField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            checkTextField.heightAnchor.constraint(equalToConstant: 40),
            checkTextField.widthAnchor.constraint(equalToConstant: 100),

            checkGuessButton.topAnchor.constraint(equalTo: view.topAnchor),
            checkGuessButton.leadingAnchor.constraint(equalTo: checkTextField.trailingAnchor, constant: 20),
            checkGuessButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            checkGuessButton.heightAnchor.constraint(equalToConstant: 40),
            
            indicatorButton.topAnchor.constraint(equalTo: checkGuessButton.bottomAnchor, constant: 10),
            indicatorButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            indicatorButton.heightAnchor.constraint(equalToConstant: 30),
            indicatorButton.widthAnchor.constraint(equalToConstant: 100)
            ])
        
        NSLayoutConstraint.activate(stackViewContraints())
        
        
    }
}

var post = PostTitle(title: "My post!")
