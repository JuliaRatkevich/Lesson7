//
//  UITabBarController.swift
//  Lesson7
//
//  Created by Yuliya Ratkevcih on 11.10.20.
//  Copyright © 2020 Yuliya Ratkevcih. All rights reserved.
//

import UIKit

class MyTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        

        
    }
}

extension MyTabBarController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
        print(type(of: viewController))
    }
    
    
}
