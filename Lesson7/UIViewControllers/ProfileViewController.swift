//
//  ProfileViewController.swift
//  Lesson7
//
//  Created by Yuliya Ratkevcih on 16.10.20.
//  Copyright © 2020 Yuliya Ratkevcih. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    @IBOutlet weak var prifileName: UILabel!
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    let photoGallery = PhotoGallery()
    let identifire = "PhotoCollectionViewCell"
    let cellsPerRow = 3
    let offSet: CGFloat = 2.0
    let imagePicker = UIImagePickerController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        avatarImage.layer.cornerRadius = 60
        avatarImage.layer.borderWidth = 3.0
        avatarImage.layer.borderColor = UIColor.lightGray.cgColor
        collectionView.delegate = self
        collectionView.dataSource = self
        imagePicker.delegate = self
        
        collectionView.register(UINib(nibName: "PhotoCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: identifire)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapOnImage))
        
        avatarImage.addGestureRecognizer(tapGesture)
        avatarImage.isUserInteractionEnabled = true
        
    }
    
    @objc func tapOnImage(_sender: UITapGestureRecognizer){
        let alert = UIAlertController(title: "Image", message: nil, preferredStyle: .actionSheet)
        
        
        let actionPhoto = UIAlertAction(title: "From Gallery", style: .default) { (alert) in
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.allowsEditing = true
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        
        let actionCamera = UIAlertAction(title: "From Camera", style: .default) { _ in
            self.imagePicker.sourceType = .photoLibrary
            self.present(self.imagePicker, animated: true, completion: nil)
        }
        
        let actionCansel = UIAlertAction(title: "Cansel", style: .cancel, handler: nil)
        
        alert.addAction(actionPhoto)
        alert.addAction(actionCamera)
        alert.addAction(actionCansel)
        
        
        let t: [Int] = [11, 2, 3, 4]
        
        t.forEach( {i in print(i) }
        )
        
        t.forEach() { i in
            print(i)
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let name = UserDefaults.standard.string(forKey: "nameKey") {
            prifileName.text = name
        }
    }
}

extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoGallery.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifire, for: indexPath) as! PhotoCollectionViewCell
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(identifier: "FullScreenViewController") as! FullScreenViewController
        vc.photoGallery = photoGallery
        vc.indexPath = indexPath
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            avatarImage.image = pickedImage
        }
        dismiss(animated: true, completion: nil)
    }
}
