//
//  LogInViewController.swift
//  Navigation
//
//  Created by ln on 06.09.2022.
//

import UIKit

class LogInViewController: UIViewController {
    
    
    var password: String = ""
    private let factory: LoginFactory = MyLoginFactory()
    
    lazy private var loginDelegate: LoginViewControllerDelegate = factory.makeLoginInspector()
    
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

        button.addTarget(self, action: #selector(self.didTapLogInButton), for: .touchUpInside)

        return button
    }()
    
    private lazy var tuckUpButton: UIButton = {
        let button = UIButton()
    
        button.setTitle("Подобрать пароль", for: .normal)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.layer.borderWidth = 0.5
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(self.didTapTuckUpButton), for: .touchUpInside)

        return button
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    @objc private func didTapLogInButton() {
        
#if DEBUG
        
        let service = TestUserService()
        
#else
        
        let service = CurrentUserService()
        
#endif
        
        let login = loginTextField.text!
        let password = passwordTextField.text!
        
        do {
            if try loginDelegate.check(log: login, pass: password) {
                let vc = ProfileViewController()
                vc.user = service.user
                vc.modalPresentationStyle = .automatic
                self.navigationController?.pushViewController(vc, animated: true)
            }
        } catch LoginError.incorrectPassword {
            handleError(message: "Неверный пароль")
        } catch LoginError.userIsNotFound {
            handleError(message: "Пользователь с таким логином не существует")
        } catch {
            handleError(message: "Неизвестная ошибка")
        }
    }
    
    private func handleError(message: String) {
        let alertController = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        let closeAction = UIAlertAction(title: "Зыкрыть", style: .default) { _ in
            self.dismiss(animated: true)
        }
        alertController.addAction(closeAction)
        self.present(alertController, animated: true)
    }
        
        

    @objc private func didTapTuckUpButton() {
        
        let queue = DispatchQueue.global()
        let group = DispatchGroup()
        
        group.enter()
        self.activityIndicator.startAnimating()
        
        queue.async {
            self.bruteForce(passwordToUnlock: self.randomPassword(passwordLength: 4))
            group.leave()
        }
        
        group.notify(queue: .main) { [self] in
            self.passwordTextField.isSecureTextEntry = false
            self.passwordTextField.text = self.password
            self.activityIndicator.stopAnimating()
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
        self.scrollView.addSubview(self.tuckUpButton)
        self.passwordTextField.addSubview(activityIndicator)
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
            
            self.tuckUpButton.topAnchor.constraint(equalTo: self.logInButton.bottomAnchor, constant: 16),
            self.tuckUpButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 16),
            self.tuckUpButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -16),
            self.tuckUpButton.heightAnchor.constraint(equalTo: self.scrollView.safeAreaLayoutGuide.heightAnchor, multiplier: 0.06112469),
            
            self.activityIndicator.trailingAnchor.constraint(equalTo: self.passwordTextField.trailingAnchor, constant: -5),
            self.activityIndicator.heightAnchor.constraint(equalTo: self.passwordTextField.heightAnchor)
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

            let tuckUpButtonBottomPointY = self.tuckUpButton.frame.origin.y + self.tuckUpButton.frame.height
            let keyboardOriginY =  self.view.frame.height - keyboardHeight

            let offset = keyboardOriginY <= tuckUpButtonBottomPointY
            ? tuckUpButtonBottomPointY - keyboardOriginY + 16
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

extension String {
    var digits:      String { return "0123456789" }
    var lowercase:   String { return "abcdefghijklmnopqrstuvwxyz" }
    var uppercase:   String { return "ABCDEFGHIJKLMNOPQRSTUVWXYZ" }
    var punctuation: String { return "!\"#$%&'()*+,-./:;<=>?@[\\]^_`{|}~" }
    var letters:     String { return lowercase + uppercase }
    var printable:   String { return digits + letters + punctuation }



    mutating func replace(at index: Int, with character: Character) {
        var stringArray = Array(self)
        stringArray[index] = character
        self = String(stringArray)
    }
}

extension LogInViewController {
    
    func bruteForce(passwordToUnlock: String) {
        let ALLOWED_CHARACTERS: [String] = String().printable.map { String($0) }

        while password != passwordToUnlock {
            password = generateBruteForce(password, fromArray: ALLOWED_CHARACTERS)
        }
        
        print(password)
    }
    
    func indexOf(character: Character, _ array: [String]) -> Int {
        return array.firstIndex(of: String(character))!
    }

    func characterAt(index: Int, _ array: [String]) -> Character {
        return index < array.count ? Character(array[index])
                                   : Character("")
    }

    func generateBruteForce(_ string: String, fromArray array: [String]) -> String {
        var str: String = string

        if str.count <= 0 {
            str.append(characterAt(index: 0, array))
        }
        else {
            str.replace(at: str.count - 1,
                        with: characterAt(index: (indexOf(character: str.last!, array) + 1) % array.count, array))

            if indexOf(character: str.last!, array) == 0 {
                str = String(generateBruteForce(String(str.dropLast()), fromArray: array)) + String(str.last!)
            }
        }

        return str
    }
    
    func randomPassword(passwordLength: Int) -> String {
        let signs = String().printable
        return String((0..<passwordLength).map{ _ in signs.randomElement()! })
    }
}
