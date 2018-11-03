//
//  ViewController.swift
//  SST House Points App
//
//  Created by Sebastian Choo on 14/7/18.
//  Copyright © 2018 SebastianChoo.Co. All rights reserved.
//

import UIKit
import FirebaseDatabase

class MainPageViewController: UIViewController {
    let foregroundColour = UserDefaults.standard.colorForKey(key: "foregroundColour")
    let backgroundColour = UserDefaults.standard.colorForKey(key: "backgroundColour")
    let secondaryColour = UserDefaults.standard.colorForKey(key: "secondaryColour")
    let currentHouse = "\(UserDefaults.standard.object(forKey: "houseMember") ?? "No House")"
    //Blank Alert
    let alert = UIAlertController(title: "Connection Error", message: "Please check your connection and try again.", preferredStyle: .alert)
    var ref: DatabaseReference!

    @IBOutlet weak var iconLabel: UIImageView!
    @IBOutlet weak var mottoLabel: UILabel!
    
    func addHouseIcon(house: String) {
        var icon: UIImage!
        icon = UIImage(named: house)
        iconLabel.image = icon
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
        view.backgroundColor = backgroundColour
        mottoLabel.textColor = .white

        var houseMotto: String!
        //Setting House Icon
        switch currentHouse {
        case "Black House":
            addHouseIcon(house: "blackHouse")
            ref.child("houseInfo").child("1").child("7").observeSingleEvent(of: .value) { (snapshot) in
                houseMotto = (snapshot.value! as? String)!
                self.mottoLabel.text = houseMotto
            }
        case "Red House":
            addHouseIcon(house: "redHouse")
            ref.child("houseInfo").child("2").child("7").observeSingleEvent(of: .value) { (snapshot) in
                houseMotto = (snapshot.value! as? String)!
                self.mottoLabel.text = houseMotto
            }
        case "Green House":
            addHouseIcon(house: "greenHouse")
            ref.child("houseInfo").child("3").child("7").observeSingleEvent(of: .value) { (snapshot) in
                houseMotto = (snapshot.value! as? String)!
                self.mottoLabel.text = houseMotto
            }
        case "Blue House":
            addHouseIcon(house: "blueHouse")
            ref.child("houseInfo").child("4").child("7").observeSingleEvent(of: .value) { (snapshot) in
                houseMotto = (snapshot.value! as? String)!
                self.mottoLabel.text = houseMotto
            }
        case "Yellow House":
            addHouseIcon(house: "yellowHouse")
            ref.child("houseInfo").child("5").child("7").observeSingleEvent(of: .value) { (snapshot) in
                houseMotto = (snapshot.value! as? String)!
                self.mottoLabel.text = houseMotto
            }
        default:
            self.alert.addAction(UIAlertAction(title: NSLocalizedString("Dismiss", comment: "Default action"), style: .default, handler: { _ in
                NSLog("The \"OK\" alert occured.")
            }))
            self.present(self.alert, animated: true, completion: nil)
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
