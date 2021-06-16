//
//  UserViewController.swift
//  Lesson7
//
//  Created by Yuliya Ratkevcih on 20.10.20.
//  Copyright © 2020 Yuliya Ratkevcih. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = user.name
        cityLabel.text = user.city
        imageView.image = user.avatar
        
        cityLabel.textColor = .lightGray
        imageView.layer.borderWidth = 3.0
        
        if user.gender == .male {
            imageView.layer.borderColor = UIColor.red.cgColor
        }
        
        imageView.layer.borderColor = UIColor.yellow.cgColor
    }
    
}
