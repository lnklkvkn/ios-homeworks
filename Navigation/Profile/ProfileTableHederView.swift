//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by ln on 24.08.2022.
//

import UIKit
import SnapKit

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
    
    private lazy var setStatusButton: UIButton = {
        let button = UIButton()
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
    
    @objc private func didTapButton() {
        statusLabel.text = statusText
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
        
        profileHeaderView.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.equalToSuperview()
            make.trailing.equalToSuperview()
            make.bottom.equalToSuperview()
        }
        
        avatarImageView.snp.makeConstraints { make in
            make.top.equalTo(profileHeaderView.snp.top).offset(16)
            make.leading.equalTo(profileHeaderView.snp.leading).offset(16)
            make.height.width.equalTo(100)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(profileHeaderView.snp.top).offset(27)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(16)
        }
        
        statusLabel.snp.makeConstraints { make in
            make.leading.equalTo(avatarImageView.snp.trailing).offset(16)
            make.trailing.equalTo(profileHeaderView.snp.trailing).inset(16)
            make.top.equalTo(avatarImageView.snp.bottom).inset(33)
        }
        
        statusLabelTextField.snp.makeConstraints { make in
            make.top.equalTo(statusLabel.snp.bottom).offset(4)
            make.height.equalTo(40)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(16)
            make.trailing.equalTo(profileHeaderView.snp.trailing).offset(-16)
        }
        
        setStatusButton.snp.makeConstraints { make in
            make.top.equalTo(statusLabelTextField.snp.bottom).offset(20)
            make.leading.equalTo(profileHeaderView.snp.leading).offset(16)
            make.trailing.equalTo(profileHeaderView.snp.trailing).inset(16)
            make.bottom.equalTo(profileHeaderView.snp.bottom).inset(16)
        }
    }

}
    

            
            




