//
//  ProfileViewController.swift
//  Navigation
//
//  Created by ln on 24.08.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    private var posts = viewModel
    private var array = [photos]

    private lazy var tableView: UITableView = {

        var tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: "HeaderView")
        tableView.register(UITableViewHeaderFooterView.self, forHeaderFooterViewReuseIdentifier: "DefHeader")
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: "PhotosCell")
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else {
            return posts.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 1 {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? PostTableViewCell {
                cell.autorLabel.text = posts[indexPath.row].author
                cell.postImageView.image = UIImage(named: posts[indexPath.row].image)
                cell.descriptionLabel.text = posts[indexPath.row].description
                cell.likesLabel.text = "Likes: \(posts[indexPath.row].likes)"
                cell.viewsLabel.text = "Views: \(posts[indexPath.row].views)"
                return cell
                
            }
        } else if indexPath.section == 0 {
                if let cell = tableView.dequeueReusableCell(withIdentifier: "PhotosCell",for: indexPath) as? PhotosTableViewCell {
                    cell.photosLabel.text = array[indexPath.row].title
                    cell.arrowImageView.image = UIImage(systemName: array[indexPath.row].arrow)
                    cell.firstPhotoImageView.image = UIImage(named: array[indexPath.row].fPhoto)
                    cell.secondPhotoImageView.image = UIImage(named: array[indexPath.row].sPhoto)
                    cell.thirdPhotoImageView.image = UIImage(named: array[indexPath.row].tPhoto)
                    cell.fourthPhotoImageView.image = UIImage(named: array[indexPath.row].fourPhoto)
                    return cell
                }
            }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            self.tableView.deselectRow(at: indexPath, animated: true)
            let vc = PhotosViewController()
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}
    






    

