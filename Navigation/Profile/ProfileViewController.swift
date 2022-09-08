//
//  ProfileViewController.swift
//  Navigation
//
//  Created by ln on 24.08.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private lazy var someButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 364, width: 414, height: 50))
        button.backgroundColor = .systemBlue
        button.setTitle("Some button", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.layer.cornerRadius = 4
        button.translatesAutoresizingMaskIntoConstraints = false

        return button
    }()
    
    private lazy var profileHeaderView: ProfileHeaderView = {
         let profileHeaderView = ProfileHeaderView(frame: CGRect(x: 0, y: 90, width: 414, height: 720))
         profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
         return profileHeaderView
     }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Profile"
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.profileHeaderView)
        self.view.addSubview(someButton)
        NSLayoutConstraint.activate(profileViewContraints())
        NSLayoutConstraint.activate(someButtonContrains())
    }

    private func someButtonContrains() -> [NSLayoutConstraint] {
        let bottomConstraint = NSLayoutConstraint(item: self.someButton, attribute: .bottom, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .bottom, multiplier: 1, constant: 0)
        let leadingConstraint = self.someButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let trailingConstraint = self.someButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        return [
            bottomConstraint, leadingConstraint,trailingConstraint
        ]
    }
    
    private func profileViewContraints() -> [NSLayoutConstraint] {
        let topContraint = NSLayoutConstraint(item: self.profileHeaderView, attribute: .top, relatedBy: .equal, toItem: self.view.safeAreaLayoutGuide, attribute: .top, multiplier: 1, constant: 0)
        let leftContraint = self.profileHeaderView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor)
        let rightContraint = self.profileHeaderView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
  
        let heightAnchor = self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220)
        
        return [
            topContraint, leftContraint, rightContraint, heightAnchor
        ]
    }
    
}

