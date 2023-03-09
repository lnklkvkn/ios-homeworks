//
//  CustomButton.swift
//  Navigation
//
//  Created by ln on 09.03.2023.
//

import UIKit

class CustomButton: UIButton {

    let completion: () -> Void
    
    init(title: String, completion: @escaping () -> Void) {
        
        self.completion = completion
    
        super.init(frame: .zero)
        
        setTitleColor(UIColor.white, for: .normal)
        setTitle(title, for: .normal)
        layer.cornerRadius = 4
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 4, height: 4)
        layer.shadowRadius = 4
        layer.shadowOpacity = 0.7
        backgroundColor = .systemBlue
        translatesAutoresizingMaskIntoConstraints = false
        addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)

    }

//    internal init(completion: @escaping () -> Void) {
//        self.completion = completion
//    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func didTapButton() {
        completion()
    }
}



//let button = UIButton()
//button.backgroundColor = .systemBlue
//button.setTitle("Show status", for: .normal)
//button.setTitleColor(UIColor.white, for: .normal)
//button.layer.cornerRadius = 4
//button.layer.shadowColor = UIColor.black.cgColor
//button.layer.shadowOffset = CGSize(width: 4, height: 4)
//button.layer.shadowRadius = 4
//button.layer.shadowOpacity = 0.7
//button.translatesAutoresizingMaskIntoConstraints = false
//
//button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)

//@objc private func didTapButton() {
//    statusLabel.text = statusText
//}
