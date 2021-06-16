//
//  SettingsTableViewController.swift
//  Lesson7
//
//  Created by Yuliya Ratkevcih on 19.10.20.
//  Copyright © 2020 Yuliya Ratkevcih. All rights reserved.
//

import UIKit

class SettingsTableViewController: UITableViewController {
    
    let nameKey = "nameKey"
    let soundKey = "soundKey"
    let volumKey = "volumKey"
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var volSlider: UISlider!
    @IBOutlet weak var soundSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        loadSettings()
        
        
    }
    func loadSettings() {
        if let name = UserDefaults.standard.string(forKey: nameKey){
            nameField.text = name
        }
        soundSwitch.isOn = UserDefaults.standard.bool(forKey: soundKey)
        volSlider.value = UserDefaults.standard.float(forKey: volumKey)
        
    }
    
    @IBAction func changeName(_ sender: UITextField) {
        if (sender.text != nil) {
            UserDefaults.standard.set(sender.text!, forKey: nameKey)
        }
    }
    
    
    @IBAction func soundAction(_ sender: UISwitch) {
        UserDefaults.standard.set(sender.isOn, forKey: soundKey)
    }
    
    
    @IBAction func volumAction(_ sender: UISlider) {
        UserDefaults.standard.set(sender.value, forKey: volumKey)
        
    }
}
