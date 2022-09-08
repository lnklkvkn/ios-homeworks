//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by ln on 24.08.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
     lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 16, y: 16, width: 100, height: 100))
        imageView.image = UIImage(named: "cat")
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Catty Clappy"
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 18.0)
        label.textColor = UIColor.black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Waiting for something..."
        label.font = UIFont(name:"HelveticaNeue-Regular", size: 14.0)
        label.textColor = UIColor.gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var setStatusButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 16, y: 165, width: 382, height: 50))
        button.backgroundColor = .systemBlue
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 4
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
        
        return button
    }()
    
    private lazy var statusLabelTextField : UITextField = {
        let textField = UITextField(frame: CGRect (x: 138, y: 110, width: 260, height: 40))
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 12
        textField.font = UIFont(name: "HelveticaNeue-Regular", size: 15)
        textField.textColor = UIColor.black
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(self.statusTextChanged), for: .editingChanged)
        
        return textField
    }()
    
    private var statusText: String = ""
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didTapButton() {
        statusLabel.text = statusText
    }

    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? "no status"
    }
    
    private func setupView() {
        self.backgroundColor = .lightGray

        self.addSubview(self.avatarImageView)
        self.addSubview(self.stackView)
        self.stackView.addArrangedSubview(self.nameLabel)
        self.stackView.addArrangedSubview(self.statusLabel)
        self.addSubview(self.statusLabelTextField)
        self.addSubview(self.setStatusButton)

        let avatarImageViewContrains = self.avatarImageViewContrains()
        let stackViewContrains = self.stackViewContrains()
        let statusLabelTextFieldContrains = self.statusLabelTextFieldContrains()
        let setStatusButtonContrains = self.setStatusButtonContrains()

        NSLayoutConstraint.activate(avatarImageViewContrains + stackViewContrains + statusLabelTextFieldContrains + setStatusButtonContrains)
    }
    
    private func avatarImageViewContrains() -> [NSLayoutConstraint] {
        let topConstraint = self.avatarImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 16)
        let leadingConstraint = self.avatarImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let heightAnchor = self.avatarImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.45454545)
        let widthAnchor = self.avatarImageView.widthAnchor.constraint(equalTo: self.avatarImageView.heightAnchor)
 
        return [
            topConstraint, leadingConstraint, widthAnchor, heightAnchor
        ]
    }
    
    private func stackViewContrains() -> [NSLayoutConstraint] {
        let topConstraint = self.stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 27)
        let leadingConstraint = self.stackView.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16)
        let heightAnchor = self.stackView.heightAnchor.constraint(equalTo: self.avatarImageView.heightAnchor, multiplier: 1)

        return [
            topConstraint, leadingConstraint, heightAnchor
        ]
    }

    private func statusLabelTextFieldContrains() -> [NSLayoutConstraint] {
        let topConstraint = self.statusLabelTextField.topAnchor.constraint(equalTo: self.stackView.bottomAnchor, constant: 3)
        let leadingConstraint = self.statusLabelTextField.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16)
        let trailingConstraint = self.statusLabelTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        return [
            topConstraint, leadingConstraint,trailingConstraint
        ]
    }
    
    private func setStatusButtonContrains() -> [NSLayoutConstraint] {
        let topConstraint = self.setStatusButton.topAnchor.constraint(equalTo: self.statusLabelTextField.bottomAnchor, constant: 16)
        let leadingConstraint = self.setStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 16)
        let trailingConstraint = self.setStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16)
        return [
            topConstraint, leadingConstraint,trailingConstraint
        ]
    }
        
    
}
