//
//  FriendsViewController.swift
//  Lesson7
//
//  Created by Yuliya Ratkevcih on 11.10.20.
//  Copyright © 2020 Yuliya Ratkevcih. All rights reserved.
//

import UIKit

class FriendsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet var tableView: UITableView!

    var modelUser = ModelUser()

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = modelUser.users[section]
        return section.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return modelUser.users.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Man"
        }
        return "Woman"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FriendsTableViewCell") as! FriendsTableViewCell
        
        let section = modelUser.users[indexPath.section]
        let user = section[indexPath.row]
        
        cell.friendsLabel.text = user.name
        cell.friendsView.image = user.avatar
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = modelUser.users[indexPath.section]
        let user = section[indexPath.row]
        let alert = UIAlertController(title: user.name, message: user.city, preferredStyle: .actionSheet)
        
        let profileAction = UIAlertAction(title: "Profile", style: .default) { (alert) in
            self.performSegue(withIdentifier: "goToPrifile", sender: indexPath)
        }
        
        let deleteAction = UIAlertAction(title: "Remove from Friends", style: .destructive) { (alert) in
            self.modelUser.users[indexPath.section].remove(at: indexPath.row)
            tableView.reloadData()
               }
        
        alert.addAction(profileAction)
        alert.addAction(deleteAction)
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToPrifile" {
            let vc = segue.destination as! UserViewController
            let indexPath = sender as! IndexPath
            let section = modelUser.users[indexPath.section]
            let user = section[indexPath.row]
            vc.user = user
        }
    }
}
