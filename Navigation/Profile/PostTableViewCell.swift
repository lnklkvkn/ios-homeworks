//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by ln on 09.09.2022.
//

import UIKit

class PostTableViewCell: UITableViewCell {
        
    private(set) lazy var autorLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var postImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.textColor = .systemGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var likesLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var viewsLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setupView()
    }
    

    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.setupView()
    }
    
    private func setupView() {
        self.contentView.addSubview(self.autorLabel)
        self.contentView.addSubview(self.postImageView)
        self.contentView.addSubview(self.descriptionLabel)
        self.contentView.addSubview(self.likesLabel)
        self.contentView.addSubview(self.viewsLabel)
        
        NSLayoutConstraint.activate([
            
            self.autorLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 16),
            self.autorLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.autorLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
           

            self.postImageView.topAnchor.constraint(equalTo: self.autorLabel.bottomAnchor, constant: 16),
            self.postImageView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            self.postImageView.heightAnchor.constraint(equalTo: self.contentView.widthAnchor),
            
            self.descriptionLabel.topAnchor.constraint(equalTo: self.postImageView.bottomAnchor, constant: 16),
            self.descriptionLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.descriptionLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
          
            
            self.likesLabel.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 16),
            self.likesLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16),
            self.likesLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16),
            
           
            self.viewsLabel.topAnchor.constraint(equalTo: self.descriptionLabel.bottomAnchor, constant: 16),
            self.viewsLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16),
            self.viewsLabel.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -16),
     
        ])
    }
        
}

      
