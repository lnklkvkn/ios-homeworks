//
//  InfoViewController.swift
//  Navigation
//
//  Created by ln on 18.08.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemMint
        self.view.addSubview(self.button)
        self.button.center = self.view.center
    }

    private lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.backgroundColor = .systemBlue
        button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
        button.setTitle("Показать allert", for: .normal)
        return button
    }()
    
    @objc private func didTapButton() {
        
        let alertController = UIAlertController(title: "lol", message: "kek", preferredStyle: .alert)
        
        let firstAction = UIAlertAction(title: "Привет", style: .default) { _ in
            print("Privet")
        }
        
        let secondAction = UIAlertAction(title: "Пока", style: .cancel) { _ in
            print("Pokasiki")
        }
        
        alertController.addAction(firstAction)
        alertController.addAction(secondAction)
        
        self.present(alertController, animated: true)
    }
}

