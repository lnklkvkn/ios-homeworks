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
    
// Задание  10: таймер для обновления секретного слова
    
    private var timer: Timer?
    
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

        return textField
    }()
    
    private lazy var checkGuessButton = CustomButton(title: "Проверить слово", completion: { [self] in if self.checkTextField.text != nil {
        feedModel.check(word: self.checkTextField.text!)
        if feedModel.isTrue {
            indicatorButton.backgroundColor = .green
        } else {
            indicatorButton.backgroundColor = .red
        }
    }
    })
    
    private lazy var indicatorButton: UILabel = {
        let label = UILabel()
        label.backgroundColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var updateStatusTextField : UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 5
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.placeholder = "   Слово скоро обновится..."
        textField.translatesAutoresizingMaskIntoConstraints = false

        return textField
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
    

    init() {
        super.init(nibName: nil, bundle: nil)
        
        self.timer = Timer.scheduledTimer(timeInterval: 15,
                                          target: self,
                                          selector: #selector(updateSecretWord),
                                          userInfo: nil,
                                          repeats: true)

        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        timer?.invalidate()
        timer = nil
    }
    
    @objc private func updateSecretWord() {
        let date = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        let second = calendar.component(.second, from: date)
        
        feedModel.secretWord = feedModel.secretWords.randomElement() ?? "cat"
        updateStatusTextField.text = "   Слово обновлено в \(hour):\(minute):\(second)"
    
    }
    
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
        self.view.addSubview(self.checkTextField)
        self.view.addSubview(self.checkGuessButton)
        self.view.addSubview(self.indicatorButton)
        self.view.addSubview(self.updateStatusTextField)
        self.stackView.addArrangedSubview(self.firstButton)
        self.stackView.addArrangedSubview(self.secondButton)
        
        NSLayoutConstraint.activate([
            
            checkTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            checkTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            checkTextField.heightAnchor.constraint(equalToConstant: 40),
            checkTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.45),

            checkGuessButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            checkGuessButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            checkGuessButton.heightAnchor.constraint(equalToConstant: 40),
            checkGuessButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.45),
            
            indicatorButton.topAnchor.constraint(equalTo: checkGuessButton.bottomAnchor, constant: 10),
            indicatorButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            indicatorButton.heightAnchor.constraint(equalToConstant: 30),
            indicatorButton.widthAnchor.constraint(equalToConstant: 100),
            
            updateStatusTextField.topAnchor.constraint(equalTo: indicatorButton.bottomAnchor, constant: 20),
            updateStatusTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            updateStatusTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            updateStatusTextField.heightAnchor.constraint(equalToConstant: 30)
            
            ])
        
        NSLayoutConstraint.activate(stackViewContraints())
        
    }
}

var post = PostTitle(title: "My post!")
