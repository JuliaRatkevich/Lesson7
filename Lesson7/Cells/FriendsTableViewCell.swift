//
//  FriendsTableViewCell.swift
//  Lesson7
//
//  Created by Yuliya Ratkevcih on 20.10.20.
//  Copyright © 2020 Yuliya Ratkevcih. All rights reserved.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {

    @IBOutlet var friendsLabel: UILabel!
    @IBOutlet var friendsView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
