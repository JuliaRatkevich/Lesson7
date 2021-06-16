//
//  User.swift
//  Lesson7
//
//  Created by Yuliya Ratkevcih on 20.10.20.
//  Copyright © 2020 Yuliya Ratkevcih. All rights reserved.
//

import Foundation
import UIKit

enum Gender {
    case male
    case fimale
    
}

struct User {
    
    var name: String
    var city: String
    var avatar: UIImage?
    var gender: Gender
    
}
