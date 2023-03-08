//
//  CustomPhotoCell.swift
//  Navigation
//
//  Created by ln on 06.10.2022.
//

import UIKit

class CustomPhotoCell: UICollectionViewCell {
    
    private lazy var photo: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(with image: UIImage) {
        self.photo.image = image
    }

    private func setupView() {
        self.addSubview(self.photo)
        
        NSLayoutConstraint.activate([
            self.photo.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            self.photo.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0),
            self.photo.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0),
            self.photo.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0)
        ])
    }
}

var photosCollection = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"]

var photosCollectionAsUIImages = [UIImage(named: "1")!, UIImage(named: "2")!, UIImage(named: "3")!, UIImage(named: "4")!, UIImage(named: "5")!, UIImage(named: "6")!, UIImage(named: "7")!, UIImage(named: "8")!, UIImage(named: "9")!, UIImage(named: "10")!, UIImage(named: "11")!, UIImage(named: "12")!, UIImage(named: "13")!, UIImage(named: "14")!, UIImage(named: "15")!, UIImage(named: "16")!, UIImage(named: "17")!, UIImage(named: "18")!]

