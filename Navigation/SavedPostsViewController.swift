//
//  SavedPostsViewController.swift
//  Navigation
//
//  Created by ln on 09.06.2023.
//

import UIKit
import StorageService

class SavedPostsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    private lazy var tableView: UITableView = {

        var tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: "CustomCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 500
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        setupView()
        NotificationCenter.default.addObserver(self, selector: #selector(doAfterNotified), name: NSNotification.Name("updateSavedPosts"), object: nil)

    }
        
    @objc private func doAfterNotified() {
        
        let group = DispatchGroup()
        group.enter()
        print("****** ПРИШЛО УВЕДОМЛЕНИЕ О НОВЫХ СОХРАНЕНКАХ ********")
        group.leave()
        group.notify(queue: .main) {
            self.tableView.reloadData()
        }
    }
    
    private func setupView() {
        
        self.view.addSubview(self.tableView)
        tableView.dataSource = self
        tableView.delegate = self
        NSLayoutConstraint.activate([
        
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
       return "Saved posts"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        CoreDataMamanager.shared.fetchPosts().count
    }
    
    var desc = ""
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? PostTableViewCell {
            let posts = CoreDataMamanager.shared.fetchPosts()
            cell.autorLabel.text = posts[indexPath.row].autor
            cell.postImageView.image = UIImage(named: posts[indexPath.row].image ?? "")
            cell.descriptionLabel.text = posts[indexPath.row].text
            cell.likesLabel.text = "Likes: \(posts[indexPath.row].likes)"
            cell.viewsLabel.text = "Views: \(posts[indexPath.row].views)"
            
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
            tap.numberOfTapsRequired = 2
            cell.addGestureRecognizer(tap)
            desc = cell.descriptionLabel.text ?? ""
            
            return cell
        }

        return UITableViewCell()
    }
    

    
    @objc func doubleTapped() {
        
        let group = DispatchGroup()
        group.enter()
        CoreDataMamanager.shared.deletaPost(with: desc)
        
        print("******  Удалить пост ********")
        group.leave()
        group.notify(queue: .main) {
            self.tableView.reloadData()
        }
        
    }
    
    
}
