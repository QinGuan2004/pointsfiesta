//
//  ViewController.swift
//  SST House Points App
//
//  Created by Sebastian Choo on 14/7/18.
//  Copyright © 2018 SebastianChoo.Co. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class MainPageViewController: UIViewController {
    let foregroundColour = UserDefaults.standard.colorForKey(key: "foregroundColour")
    let backgroundColour = UserDefaults.standard.colorForKey(key: "backgroundColour")
    let secondaryColour = UserDefaults.standard.colorForKey(key: "secondaryColour")
    let currentHouse = "\(UserDefaults.standard.object(forKey: "houseMember") ?? "No House")"
    let userEmail = "\(UserDefaults.standard.object(forKey: "email") ?? "No Email")"

    //Blank Alert
    let alert = UIAlertController(title: "Connection Error", message: "Please check your connection and try again.", preferredStyle: .alert)
    var ref: DatabaseReference!
    var ref1: DocumentReference? = nil
    let db = Firestore.firestore()
    lazy var settings = db.settings
    @IBOutlet weak var iconLabel: UIImageView!
    @IBOutlet weak var mottoLabel: UILabel!
    @IBOutlet weak var captainLabel: UILabel!
    @IBOutlet weak var viceCaptainLabel: UILabel!
    @IBOutlet weak var masterLabel: UILabel!
    @IBOutlet weak var meetingLabel: UILabel!
    
    func addHouseIcon(house: String) {
        var icon: UIImage!
        icon = UIImage(named: house)
        iconLabel.image = icon
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColour
        mottoLabel.textColor = .white

        var houseMotto: String!
        var houseCaptain = ""
        var viceHouseCaptain = ""
        var houseMaster = ""
        var meetingLocation = ""
        
        //Setting House Icon
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
