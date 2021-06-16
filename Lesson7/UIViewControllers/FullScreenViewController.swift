//
//  FullScreenViewController.swift
//  Lesson7
//
//  Created by Yuliya Ratkevcih on 17.10.20.
//  Copyright © 2020 Yuliya Ratkevcih. All rights reserved.
//

import UIKit

class FullScreenViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var photoGallery: PhotoGallery!
    let cellsPerRow = 1
    let identifier = "FullScreenCell"
    var indexPath: IndexPath!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        collectionView.register(UINib(nibName: "FullScreenCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifier)
        
        collectionView.performBatchUpdates(nil) { /*(result)*/ _ in
            self.collectionView.scrollToItem(at: self.indexPath, at: .centeredHorizontally, animated: false)

        }
    }
}

extension FullScreenViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoGallery.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath) as! FullScreenCollectionViewCell
        cell.photoView.image = photoGallery.images[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let flowLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let viewWidth = collectionView.frame.width
        let numOfSpaces = cellsPerRow - 1
        let availableWidth = viewWidth - CGFloat(numOfSpaces) * flowLayout.minimumInteritemSpacing
        let itemWidth = availableWidth / CGFloat(cellsPerRow)
        
        return CGSize(width: itemWidth, height: itemWidth)
        
        
        
    }
}


