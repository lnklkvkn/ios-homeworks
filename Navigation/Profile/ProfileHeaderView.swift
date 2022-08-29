//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by ln on 24.08.2022.
//

import UIKit

class ProfileHeaderView: UIView {
    
    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 16, y: 16, width: 100, height: 100))
        imageView.image = UIImage(named: "cat")
        imageView.layer.cornerRadius = imageView.bounds.height / 2
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 3
        imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 138, y: 27, width: 2600, height: 30))
        label.text = "Catty Clappy"
        label.font = UIFont(name:"HelveticaNeue-Bold", size: 18.0)
        label.textColor = UIColor.black
        return label
    }()
    
    private lazy var statusLabel: UILabel = {
        let label = UILabel(frame: CGRect(x: 138, y: 74, width: 260, height: 30))
        label.text = "Waiting for something..."
        label.font = UIFont(name:"HelveticaNeue-Regular", size: 14.0)
        label.textColor = UIColor.gray
        return label
    }()
    
    private lazy var statusButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 16, y: 165, width: 382, height: 50))
        button.backgroundColor = .systemBlue
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 4
        
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        
        button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
        return button
    }()
    
    private lazy var changeStatusLabelText : UITextField = {
        let textField = UITextField(frame: CGRect (x: 138, y: 110, width: 260, height: 40))
        textField.backgroundColor = .white
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.layer.cornerRadius = 12
        textField.font = UIFont(name: "HelveticaNeue-Regular", size: 15)
        textField.textColor = UIColor.black
        
        textField.addTarget(self, action: #selector(self.statusTextChanged), for: .editingChanged)
        
        return textField
    }()
    
    @objc private func didTapButton() {
        statusLabel.text = statusText
    }

    private var statusText: String = ""

    @objc private func statusTextChanged(_ textField: UITextField) {
        statusText = textField.text ?? "no status"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.backgroundColor = .lightGray
        self.addSubview(self.avatarImageView)
        self.addSubview(self.nameLabel)
        self.addSubview(self.statusButton)
        self.addSubview(self.statusLabel)
        self.addSubview(self.changeStatusLabelText)
    }
    
    
}
