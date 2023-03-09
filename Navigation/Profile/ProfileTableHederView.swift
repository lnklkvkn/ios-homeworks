//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by ln on 24.08.2022.
//

import UIKit

class ProfileHeaderView: UITableViewHeaderFooterView {
    
    
    private var statusText: String = ""
    
    private lazy var profileHeaderView: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
     lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "cat")
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Catty Clappy"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var statusLabel: UILabel = {
        let label = UILabel()
        label.text = "Waiting for something..."
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = .gray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    private lazy var setStatusButton: UIButton = {
//        let button = UIButton()
//        button.backgroundColor = .systemBlue
//        button.setTitle("Show status", for: .normal)
//        button.setTitleColor(UIColor.white, for: .normal)
//        button.layer.cornerRadius = 4
//        button.layer.shadowColor = UIColor.black.cgColor
//        button.layer.shadowOffset = CGSize(width: 4, height: 4)
//        button.layer.shadowRadius = 4
//        button.layer.shadowOpacity = 0.7
//        button.translatesAutoresizingMaskIntoConstraints = false
//
//        button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
//
//        return button
//    }()
    
    private lazy var setStatusButton = CustomButton(title: "Show status", completion: {self.statusLabel.text = self.statusText} )
    
    
    private lazy var statusLabelTextField : UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 12
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.textColor = .black
        textField.placeholder = "  Set your status..."
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(self.statusTextChanged), for: .editingChanged)
        
        return textField
    }()
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    
    required init?(coder Decoder: NSCoder) {
        super.init(coder: Decoder)
        setupView()
    }

    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? "no status"
    }
    
    private func setupView() {
        
        self.addSubview(self.profileHeaderView)
        self.addSubview(self.avatarImageView)
        self.addSubview(self.nameLabel)
        self.addSubview(self.statusLabel)
        self.addSubview(self.statusLabelTextField)
        self.addSubview(self.setStatusButton)
        

        NSLayoutConstraint.activate([
            
            profileHeaderView.topAnchor.constraint(equalTo: topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            profileHeaderView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            avatarImageView.topAnchor.constraint(equalTo: profileHeaderView.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: profileHeaderView.leadingAnchor, constant: 16),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            
            nameLabel.topAnchor.constraint(equalTo: self.profileHeaderView.topAnchor, constant: 27),
            nameLabel.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16),
            
            statusLabel.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16),
            statusLabel.trailingAnchor.constraint(equalTo: self.profileHeaderView.trailingAnchor, constant: -16),
            statusLabel.topAnchor.constraint(equalTo: self.avatarImageView.bottomAnchor, constant: -33),

            statusLabelTextField.topAnchor.constraint(equalTo: self.statusLabel.bottomAnchor, constant: 4),
            statusLabelTextField.heightAnchor.constraint(equalToConstant: 40),
            statusLabelTextField.leadingAnchor.constraint(equalTo: self.avatarImageView.trailingAnchor, constant: 16),
            statusLabelTextField.trailingAnchor.constraint(equalTo: self.profileHeaderView.trailingAnchor, constant: -16),
            
            setStatusButton.topAnchor.constraint(equalTo: self.statusLabelTextField.bottomAnchor, constant: 20),
            setStatusButton.leadingAnchor.constraint(equalTo: self.profileHeaderView.leadingAnchor, constant: 16),
            setStatusButton.trailingAnchor.constraint(equalTo: self.profileHeaderView.trailingAnchor, constant: -16),
            setStatusButton.heightAnchor.constraint(equalToConstant: 50),
            setStatusButton.bottomAnchor.constraint(equalTo: self.profileHeaderView.bottomAnchor, constant: -16),
        ])
    }
}
    

            
            




