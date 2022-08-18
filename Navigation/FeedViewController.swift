//
//  SixthViewController.swift
//  Navigation
//
//  Created by ln on 16.08.2022.
//

import UIKit

class FeedViewController: UIViewController {
    
    private lazy var button: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.backgroundColor = .systemRed
        button.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
        button.setTitle("Показать пост", for: .normal)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = . systemYellow
        
        self.view.addSubview(self.button)
        self.button.center = self.view.center
    }
    
    @objc private func didTapButton() {
        let vc = PostViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

var post = Post(title: "My post!")
