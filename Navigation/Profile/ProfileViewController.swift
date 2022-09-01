//
//  ProfileViewController.swift
//  Navigation
//
//  Created by ln on 24.08.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        self.profileHeaderView.frame = self.view.bounds
//    }

    
    
    private lazy var profileHeaderView: ProfileHeaderView = {
        let profileHeaderView = ProfileHeaderView(frame: CGRect(x: 0, y: 90, width: 414, height: 720))
        return profileHeaderView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Profile"
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.profileHeaderView)
    }
    
    
}
