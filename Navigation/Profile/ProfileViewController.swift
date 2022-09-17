//
//  ProfileViewController.swift
//  Navigation
//
//  Created by ln on 24.08.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    private var posts = viewModel
    
    private lazy var tableView: UITableView = {

        var tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "HeaderView")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 500
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupNavigationBar()
    }
    
    private func setupNavigationBar(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Profile"
        
    }
    private func setupView() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            self.tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            self.tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
}



extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") else { return nil }
            return header
        } else {
        return nil
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        posts.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        CGFloat(200.0)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? PostTableViewCell {
            cell.autorLabel.text = posts[indexPath.row].author
            cell.postImageView.image = UIImage(named: posts[indexPath.row].image)
            cell.descriptionLabel.text = posts[indexPath.row].description
            cell.likesLabel.text = "Likes: \(posts[indexPath.row].likes)"
            cell.viewsLabel.text = "Views: \(posts[indexPath.row].views)"
            return cell
        }
        return UITableViewCell()
    }
}
 



        
    
