//
//  LogInViewController.swift
//  Navigation
//
//  Created by ln on 06.09.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    private var loginDelegate: LoginViewControllerDelegate? = LoginInspector()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
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
    
    var loginTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.backgroundColor = UIColor.systemGray6
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        textField.font = UIFont(name: "systemFont-Normal", size: 16)
        textField.autocapitalizationType = .none
        textField.placeholder = "Email of phone"
        textField.translatesAutoresizingMaskIntoConstraints = false
        
        return textField
    }()
    
    lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        textField.backgroundColor = UIColor.systemGray6
        textField.layer.borderColor = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        textField.font = UIFont(name: "systemFont-Normal", size: 16)
        textField.autocorrectionType = .no
        textField.placeholder = "Password"
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
    }()
    
    private lazy var logInButton: UIButton = {
        let button = UIButton()
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
        
        let login = loginTextField.text!
        let password = passwordTextField.text!
        let isValid = loginDelegate?.check(log: login, pass: password) ?? false
        
        if isValid  {
            let vc = ProfileViewController()
            vc.modalPresentationStyle = .automatic
            self.navigationController?.pushViewController(vc, animated: true)
        } else {
            let alertController = UIAlertController(title: "Ошибка", message: "Неверный логин или пароль", preferredStyle: .alert)
            let closeAction = UIAlertAction(title: "Зыкрыть", style: .default) { _ in
                self.dismiss(animated: true)
            }
            alertController.addAction(closeAction)
            self.present(alertController, animated: true)
        }

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
   
        NSLayoutConstraint.activate([
            self.scrollView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.scrollView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.scrollView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.scrollView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            
            self.logoImageView.topAnchor.constraint(equalTo: self.scrollView.topAnchor, constant: 120),
            self.logoImageView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor),
            self.logoImageView.widthAnchor.constraint(equalTo: self.scrollView.widthAnchor, multiplier: 0.24154589),
            self.logoImageView.heightAnchor.constraint(equalTo: self.logoImageView.widthAnchor),
            
            self.textFieldsStackView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
            self.textFieldsStackView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16),
            self.textFieldsStackView.topAnchor.constraint(equalTo: self.logoImageView.bottomAnchor, constant: self.view.safeAreaLayoutGuide.layoutFrame.height/6.817),
            self.textFieldsStackView.heightAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.heightAnchor, multiplier: 0.06112469*2),
            
            self.logInButton.topAnchor.constraint(equalTo: self.textFieldsStackView.bottomAnchor, constant: 16),
            self.logInButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.logInButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            self.logInButton.heightAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.heightAnchor, multiplier: 0.06112469),
            ])
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

