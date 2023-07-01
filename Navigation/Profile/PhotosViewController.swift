//
//  PhotosViewController.swift
//  Navigation
//
//  Created by ln on 04.10.2022.
//

import UIKit
import CoreImage
import CoreImage.CIFilterBuiltins

class PhotosViewController: UIViewController {


    private func makePhotos() -> [UIImage]? {
        var arr = [UIImage]()
        for i in (1...20) {
            guard let a = UIImage(named: String(i)) else { return nil }
            arr.append(a)
        }
        return arr
    }
    
    private func blackCollection() -> [UIImage] {
        var arr = [UIImage]()
        for _ in (1...20) {
            arr.append(UIImage(systemName: "person")!)
        }
        return arr
    }
    
//    private func filterPhotos() -> [UIImage]? {
//
//        var filtredArr = [UIImage]()
//
//        for i in (1...20) {
//
//            let blur = CIFilter.sepiaTone()
//            guard let a = UIImage(named: String(i)) else { return nil }
//            let startImage = CIImage(image: (a))
//            blur.inputImage = startImage
//            let outputImage = UIImage(ciImage: blur.outputImage!)
//            filtredArr.append(outputImage)
//        }
//        return filtredArr
//    }
    
    private lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = 8
        layout.minimumLineSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
        return layout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.layout)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "DefaultCell")
        collectionView.register(CustomPhotoCell.self, forCellWithReuseIdentifier: "CustomCell")
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupView()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        self.collectionView.collectionViewLayout.invalidateLayout()
    }
    
    private func setupNavigationBar() {
        self.navigationController?.navigationBar.prefersLargeTitles = false
        self.navigationController?.visibleViewController?.navigationItem.title = "Photo Gallery"
//        self.navigationController?.visibleViewController?.navigationItem.tintColor = Palette.tintBackgroundColor
        self.navigationController?.navigationBar.topItem?.title = "Back"
        self.navigationController?.navigationBar.isHidden = false
    }
    
    private func setupView() {
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(self.collectionView)
        
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.collectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor),
            self.collectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
        if UITraitCollection.current.userInterfaceStyle == .dark {
            collectionView.reloadData()
        } else {
            collectionView.reloadData()
        }
    }
}
    
extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? CustomPhotoCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            return cell
        }

        cell.clipsToBounds = true
        
        if UITraitCollection.current.userInterfaceStyle == .dark {
            let a = blackCollection()
            cell.setup(with: a[indexPath.row])
        } else {
            let a = makePhotos()
            cell.setup(with: a![indexPath.row])
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let insets = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.sectionInset ?? .zero
        let interItemSpacing = (collectionView.collectionViewLayout as? UICollectionViewFlowLayout)?.minimumInteritemSpacing ?? 0
        
        let width = collectionView.frame.width - 2 * interItemSpacing - insets.left - insets.right
        let itemWidth = floor(width / 3)
        
        return CGSize(width: itemWidth, height: itemWidth)
    }
    

    
}
    

