//
//  PhotoGallery.swift
//  Lesson7
//
//  Created by Yuliya Ratkevcih on 16.10.20.
//  Copyright © 2020 Yuliya Ratkevcih. All rights reserved.
//

import Foundation
import UIKit

//struct PhotoItem {
//    let image: UIImage
//    let likesCount: Int
//
//}

class PhotoGallery {
//    var items: [PhotoItem]
    var images: [UIImage]
    
    convenience init() {
        var images: [UIImage] = []
        for i in 0...9 {
            let image = UIImage(named: "im\(i)")!
            images.append(image)
        }
        self.init(images)
    }
    
    init(_ images: [UIImage]) {
        self.images = images
    }
}
