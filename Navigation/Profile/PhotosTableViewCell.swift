//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by ln on 01.10.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    private(set) lazy var photosLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private(set) lazy var arrowImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .black
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var firstPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var secondPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var thirdPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private(set) lazy var fourthPhotoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
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
        
        self.contentView.addSubview(self.photosLabel)
        self.contentView.addSubview(self.arrowImageView)
        self.contentView.addSubview(self.firstPhotoImageView)
        self.contentView.addSubview(self.secondPhotoImageView)
        self.contentView.addSubview(self.thirdPhotoImageView)
        self.contentView.addSubview(self.fourthPhotoImageView)
        
        NSLayoutConstraint.activate([
            
            photosLabel.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 12),
            photosLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12),
            
            arrowImageView.centerYAnchor.constraint(equalTo: self.photosLabel.centerYAnchor),
            arrowImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12),
            
            firstPhotoImageView.topAnchor.constraint(equalTo: self.photosLabel.bottomAnchor, constant: 12),
            firstPhotoImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 12),
            firstPhotoImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12),
            firstPhotoImageView.widthAnchor.constraint(equalToConstant: (self.contentView.frame.width - 48) / 4),
            firstPhotoImageView.heightAnchor.constraint(equalTo: firstPhotoImageView.widthAnchor),
            
            
            secondPhotoImageView.topAnchor.constraint(equalTo: self.photosLabel.bottomAnchor, constant: 12),
            secondPhotoImageView.leadingAnchor.constraint(equalTo: self.firstPhotoImageView.trailingAnchor, constant: 8),
            secondPhotoImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12),
            secondPhotoImageView.widthAnchor.constraint(equalTo: firstPhotoImageView.widthAnchor),
            secondPhotoImageView.heightAnchor.constraint(equalTo: firstPhotoImageView.widthAnchor),
            
            thirdPhotoImageView.topAnchor.constraint(equalTo: self.photosLabel.bottomAnchor, constant: 12),
            thirdPhotoImageView.leadingAnchor.constraint(equalTo: self.secondPhotoImageView.trailingAnchor, constant: 8),
            thirdPhotoImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12),
            thirdPhotoImageView.widthAnchor.constraint(equalTo: firstPhotoImageView.widthAnchor),
            thirdPhotoImageView.heightAnchor.constraint(equalTo: firstPhotoImageView.widthAnchor),
            
            fourthPhotoImageView.topAnchor.constraint(equalTo: self.photosLabel.bottomAnchor, constant: 12),
            fourthPhotoImageView.leadingAnchor.constraint(equalTo: self.thirdPhotoImageView.trailingAnchor, constant: 8),
            fourthPhotoImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -12),
            fourthPhotoImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -12),
            fourthPhotoImageView.widthAnchor.constraint(equalTo: firstPhotoImageView.widthAnchor),
            fourthPhotoImageView.heightAnchor.constraint(equalTo: firstPhotoImageView.widthAnchor),
        
            ])
    }
}

struct Photos {
    var title: String
    var arrow: String
    var fPhoto: String
    var sPhoto: String
    var tPhoto: String
    var fourPhoto: String
}

var photos = Photos(title: "Photos", arrow: "arrow.right", fPhoto: "1", sPhoto: "2", tPhoto: "3", fourPhoto: "4")


