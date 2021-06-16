//
//  Model.swift
//  Lesson7
//
//  Created by Yuliya Ratkevcih on 20.10.20.
//  Copyright © 2020 Yuliya Ratkevcih. All rights reserved.
//

import Foundation
import UIKit

class ModelUser {
    var users: [[User]] = []
    
    init(){
        setup()
    }
    
    func setup(){
        let man1 = User(name: "Pasha", city: "NY", avatar: UIImage(named: "im1"), gender:.male )
        let man2 = User(name: "Sacha", city: "Berlin", avatar: UIImage(named: "im2"), gender:.male)
        
        let manArray = [man1, man2]
        
        
        let woman1 = User(name: "Sveta", city: "Minsk", avatar: UIImage(named: "im3"), gender:.fimale)
        let woman2 = User(name: "Zoi", city: "London", avatar: UIImage(named: "im4"), gender: .fimale)
        
        let womanArray = [woman1, woman2]
        
        users.append(manArray)
        users.append(womanArray)
       
    }
    
}
