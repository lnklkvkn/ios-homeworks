//
//  PhotosViewController.swift
//  Navigation
//
//  Created by ln on 04.10.2022.
//

import UIKit

import iOSIntPackage

class PhotosViewController: UIViewController {

    var photosCollection = photosCollect.map {UIImage(named: $0)!}
    var photosCollectionFiltring : [UIImage] = []

    var imageProcessor = ImageProcessor()

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
        
        let group = DispatchGroup()
        group.enter()
        let filtringStart = CFAbsoluteTimeGetCurrent()
        imageProcessor.processImagesOnThread(
            sourceImages: photosCollection,
            filter: .colorInvert,
            qos: .userInteractive) { [self] completion in
                for peoplePhoto in completion {
                    if let photo = peoplePhoto {
                        photosCollectionFiltring.append(UIImage(cgImage: photo))
                    }
                }
                
                let filtringTime = CFAbsoluteTimeGetCurrent() - filtringStart
                print("Фильтрация продолжалась \(filtringTime) секунд")
                group.leave()
            }
            
        group.notify(queue: .main) { [self] in
            photosCollection = photosCollectionFiltring
            collectionView.reloadData()
        }
        
        /* Результаты задания №8 :
         
         .default - 4.4 sec
         .background - 17.2 sec
         .userInitiated - 3.8 sec
         .userInteractive - 3.9 sec
         .utility - 3.8 sec
         
         */
        
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
}
    
extension PhotosViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
        
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photosCollection.count
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? CustomPhotoCell else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "DefaultCell", for: indexPath)
            return cell
        }

        cell.clipsToBounds = true
        cell.setup(with: photosCollection[indexPath.row])
        
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
    
    
    

