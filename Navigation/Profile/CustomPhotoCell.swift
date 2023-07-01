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


