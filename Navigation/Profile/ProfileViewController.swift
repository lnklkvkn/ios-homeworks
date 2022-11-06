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
    
    var startPoint: CGPoint?

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
    
    lazy var avatarImageView: UIImageView = {
       let imageView = UIImageView()
       imageView.image = UIImage(named: "cat")
       imageView.alpha = 0
       imageView.contentMode = .scaleAspectFill
       imageView.clipsToBounds = true
       imageView.layer.cornerRadius = 50
       imageView.isUserInteractionEnabled = true
       imageView.translatesAutoresizingMaskIntoConstraints = false
       return imageView
   }()

    private lazy var closureButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "multiply.circle.fill"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        return button
    }()
    
    private lazy var screenView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.alpha = 0
        view.isUserInteractionEnabled = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupView()
        self.setupNavigationBar()
        setupGestures()
    }
    
    private func setupNavigationBar(){
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "Profile"
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        startPoint = self.avatarImageView.center
    }
    
    private func setupView() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(tableView)
        view.addSubview(screenView)
        view.addSubview(closureButton)
        self.closureButton.isHidden = true
        view.addSubview(avatarImageView)
        
        
        NSLayoutConstraint.activate([
            
            self.tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            self.tableView.leftAnchor.constraint(equalTo: view.leftAnchor),
            self.tableView.rightAnchor.constraint(equalTo: view.rightAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            avatarImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            avatarImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            avatarImageView.widthAnchor.constraint(equalToConstant: 100),
            avatarImageView.heightAnchor.constraint(equalToConstant: 100),
            
            screenView.topAnchor.constraint(equalTo: view.topAnchor),
            screenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            screenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            screenView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            closureButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            closureButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    private func setupGestures() {
        let tapOnfullscreenBackView = UITapGestureRecognizer(target: self, action: #selector(tapOnFullScreen))
        screenView.addGestureRecognizer(tapOnfullscreenBackView)
        
        let tapOnCancelButton = UITapGestureRecognizer(target: self, action: #selector(didTapCancelButton))
        closureButton.addGestureRecognizer(tapOnCancelButton)
    }
    
    @objc func tapOnFullScreen() {
    }
    
    @objc func didTapAvatar() {
        UIView.animate(withDuration: 0.5, delay: 0.0, options: .allowUserInteraction) {
            self.screenView.isHidden = false
            self.avatarImageView.alpha = 1
            self.screenView.alpha = 0.5
            self.avatarImageView.layer.cornerRadius = 0
            self.avatarImageView.transform = CGAffineTransform(scaleX: 4, y: 4)
            self.avatarImageView.center = CGPoint(x: self.view.frame.width / 2, y: self.view.frame.height / 2)
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.closureButton.isHidden = false
            }
        }
    }
    
    @objc func didTapCancelButton() {
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut) {
            self.avatarImageView.transform = .identity
            self.avatarImageView.center = self.startPoint ?? CGPoint(x: 0, y: 0)
            self.avatarImageView.layer.cornerRadius = 50
            self.avatarImageView.alpha = 0
        } completion: { _ in
            self.screenView.isHidden = true
            self.closureButton.isHidden = true
        }
    }
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            guard let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "HeaderView") as? ProfileHeaderView else { return nil }
            let tapOnAvatarIV = UITapGestureRecognizer(target: self, action: #selector(didTapAvatar))
            header.avatarImageView.addGestureRecognizer(tapOnAvatarIV)
            header.avatarImageView.isUserInteractionEnabled = true
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
    






    

