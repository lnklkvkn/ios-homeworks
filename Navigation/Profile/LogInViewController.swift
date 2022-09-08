//
//  LogInViewController.swift
//  Navigation
//
//  Created by ln on 06.09.2022.
//

import UIKit

class LogInViewController: UIViewController {
    

    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100))
        imageView.image = UIImage(named: "logo")
        imageView.translatesAutoresizingMaskIntoConstraints = false

       return imageView
   }()
    

    private lazy var textFieldsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .fillEqually
        stackView.axis = .vertical
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    private lazy var loginTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 400, height: 50))
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor.systemGray6
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        textField.font = UIFont(name: "systemFont-Normal", size: 16)
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 0, y: 0, width: 382, height: 50))
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.backgroundColor = UIColor.systemGray6
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        textField.font = UIFont(name: "systemFont-Normal", size: 16)
        textField.autocorrectionType = .no
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()
    
    private lazy var logInButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 382, height: 50))
        button.setBackgroundImage(UIImage(named: "blue_pix"), for: .normal)
        button.setBackgroundImage(UIImage(named: "blue_pix_08"), for: .selected)
        button.setBackgroundImage(UIImage(named: "blue_pix_08"), for: .highlighted)
        button.setBackgroundImage(UIImage(named: "blue_pix_08"), for: .disabled)
    
        button.setTitle("Log in", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 10

        button.translatesAutoresizingMaskIntoConstraints = false

        button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)

        return button
    }()
    
    @objc private func didTapButton() {
        let vc = ProfileViewController()
        vc.modalPresentationStyle = .automatic
        self.present(vc,animated: true)
    }
    
    private func scrollViewContraints() -> [NSLayoutConstraint] {
        let topAnchor = self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor)
        let leftAnchor = self.scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        let rightAnchor = self.scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor)
        let bottomAnchor = self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        
        return [
            topAnchor, leftAnchor, rightAnchor, bottomAnchor
        ]
    }
    
    private func logoImageViewConstraints() -> [NSLayoutConstraint] {
        
        let topAnchor = self.logoImageView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 120)
        let centerXAnchor = self.logoImageView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor)
        let widthAnchor = self.logoImageView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 0.24154589)
        let heighAnchor = self.logoImageView.heightAnchor.constraint(equalTo: self.logoImageView.widthAnchor)
        return [topAnchor, centerXAnchor, widthAnchor, heighAnchor
        ]
    }
    
    private func textFieldsStackViewConstraints() -> [NSLayoutConstraint] {
        let leftAnchor = self.textFieldsStackView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16)
        let rightAnchor = self.textFieldsStackView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16)
        let topAnchor = self.textFieldsStackView.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: self.view.safeAreaLayoutGuide.layoutFrame.height/6.817)
        let heightAnchor = self.textFieldsStackView.heightAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.heightAnchor, multiplier: 0.06112469*2)
        return [leftAnchor, rightAnchor, topAnchor, heightAnchor]
    }
    
    private func logInButtonConstraints() -> [NSLayoutConstraint] {
        
        let topConstraint = NSLayoutConstraint(item: self.logInButton, attribute: .top, relatedBy: .equal, toItem: self.textFieldsStackView, attribute: .bottom, multiplier: 1, constant: 16)
        let leadingConstraint = self.logInButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16)
        let trailingConstraint = self.logInButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16)
        let heightAnchor = self.logInButton.heightAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.heightAnchor, multiplier: 0.06112469)
    
        return [trailingConstraint, leadingConstraint, topConstraint, heightAnchor]
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupGesture()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    private func setupView() {
        
        self.view.backgroundColor = .systemBackground
        
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.textFieldsStackView)
        self.scrollView.addSubview(self.logInButton)
        self.scrollView.addSubview(self.logoImageView)
        self.textFieldsStackView.addArrangedSubview(self.loginTextField)
        self.textFieldsStackView.addArrangedSubview(self.passwordTextField)
        
        let logoImageViewConstraints = logoImageViewConstraints()
        let textFieldsStackViewConstraints = textFieldsStackViewConstraints()
        let scrollViewContraints = scrollViewContraints()
        let logInButtonConstraints = logInButtonConstraints()
        
        NSLayoutConstraint.activate(logoImageViewConstraints +
                                    textFieldsStackViewConstraints +
                                    scrollViewContraints +
                                    logInButtonConstraints
        )
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.loginTextField.becomeFirstResponder()
    }

    private func setupGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        self.view.addGestureRecognizer(tapGesture)
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.didShowKeyboard(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.didHideKeyboard(_:)),
                                               name: UIResponder.keyboardDidHideNotification,
                                               object: nil)
    }


    @objc private func didShowKeyboard(_ notification: Notification) {
        if let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
              let keyboardRectangle = keyboardFrame.cgRectValue
              let keyboardHeight = keyboardRectangle.height

            let loginButtonBottomPointY = self.logInButton.frame.origin.y + self.logInButton.frame.height
            let keyboardOriginY =  self.view.frame.height - keyboardHeight

            let offset = keyboardOriginY <= loginButtonBottomPointY
            ? loginButtonBottomPointY - keyboardOriginY + 16
            : 0

            self.scrollView.contentOffset = CGPoint(x: 0, y: offset)
        }
    }

    @objc private func didHideKeyboard(_ notification: Notification) {
        self.hideKeyboard()
    }
    
    
    @objc private func hideKeyboard() {
        self.view.endEditing(true)
        self.scrollView.setContentOffset(.zero, animated: true)
    }


    
}

