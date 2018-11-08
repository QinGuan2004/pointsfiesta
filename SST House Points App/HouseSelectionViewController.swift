//
//  HouseSelectionViewController.swift
//  SST House Points App
//
//  Created by Sebastian Choo on 11/8/18.
//  Copyright © 2018 SebastianChoo.Co. All rights reserved.
//

//User Default

import UIKit
import FirebaseDatabase
import Firebase

class HouseSelectionViewController: UIViewController {


    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var yellowView: UIView!
    
    @IBOutlet weak var continueLabel: UIButton!
    
    var houseSelect: String = "No House"
    
    var ref: DatabaseReference! = Database.database().reference()
    var ref1: DocumentReference? = nil
    let db = Firestore.firestore()
    lazy var settings = db.settings
    let userEmail = "\(UserDefaults.standard.object(forKey: "email") ?? "No Email")"

    override func viewDidLoad() {
        super.viewDidLoad()
        // Config Buttons
        continueLabel.layer.cornerRadius = 25
        blackView.layer.cornerRadius = 30
        redView.layer.cornerRadius = 30
        blueView.layer.cornerRadius = 30
        greenView.layer.cornerRadius = 30
        yellowView.layer.cornerRadius = 30
    }
    
    @IBAction func blackTap(_ sender: Any) {
        UserDefaults.standard.setColor(color: UIColor(red: 0.01, green: 0.01, blue: 0.01, alpha: 1.0), forKey: "foregroundColour")
        UserDefaults.standard.setColor(color: UIColor(red: 0.41, green: 0.79, blue: 0.62, alpha: 1.0), forKey: "backgroundColour")
        UserDefaults.standard.setColor(color: UIColor(red: 0.16, green: 0.16, blue: 0.16, alpha: 1.0), forKey: "secondaryColour")
        houseSelect = "Black House"
        blackView.layer.borderColor = UIColor.purple.cgColor
        blackView.layer.borderWidth = 10
        redView.layer.borderWidth = 0
        blueView.layer.borderWidth = 0
        greenView.layer.borderWidth = 0
        yellowView.layer.borderWidth = 0
    }
    
    @IBAction func redTap(_ sender: Any) {
        UserDefaults.standard.setColor(color: UIColor(red: 0.93, green: 0.13, blue: 0.05, alpha: 1.0), forKey: "foregroundColour")
        UserDefaults.standard.setColor(color: UIColor(red: 0.35, green: 0.47, blue: 0.57, alpha: 1.0), forKey: "backgroundColour")
        UserDefaults.standard.setColor(color: UIColor(red: 0.62, green: 0.25, blue: 0.22, alpha: 1.0), forKey: "secondaryColour")
        houseSelect = "Red House"
        redView.layer.borderColor  = UIColor.purple.cgColor
        redView.layer.borderWidth = 10
        blueView.layer.borderWidth = 0
        greenView.layer.borderWidth = 0
        yellowView.layer.borderWidth = 0
        blackView.layer.borderWidth = 0
    }

    
    @IBAction func blueTap(_ sender: Any) {
        UserDefaults.standard.setColor(color: UIColor(red: 0.00, green: 0.64, blue: 1.00, alpha: 1.0), forKey: "foregroundColour")
        UserDefaults.standard.setColor(color: UIColor(red: 0.09, green: 0.04, blue: 0.11, alpha: 1.0), forKey: "backgroundColour")
        UserDefaults.standard.setColor(color: UIColor(red: 0.00, green: 0.46, blue: 0.73, alpha: 1.0), forKey: "secondaryColour")
        houseSelect = "Blue House"
        blueView.layer.borderWidth = 10
        blueView.layer.borderColor = UIColor.purple.cgColor
        redView.layer.borderWidth = 0
        greenView.layer.borderWidth = 0
        yellowView.layer.borderWidth = 0
        blackView.layer.borderWidth = 0
    }

    @IBAction func greenTap(_ sender: Any) {
        UserDefaults.standard.setColor(color: UIColor(red: 0.00, green: 0.60, blue: 0.00, alpha: 1.0), forKey: "foregroundColour")
        UserDefaults.standard.setColor(color: UIColor(red: 0.93, green: 0.38, blue: 0.33, alpha: 1.0), forKey: "backgroundColour")
        UserDefaults.standard.setColor(color: UIColor(red: 0.00, green: 0.44, blue: 0.00, alpha: 1.0), forKey: "secondaryColour")
        houseSelect = "Green House"
        greenView.layer.borderWidth = 10
        greenView.layer.borderColor = UIColor.purple.cgColor
        redView.layer.borderWidth = 0
        blueView.layer.borderWidth = 0
        yellowView.layer.borderWidth = 0
        blackView.layer.borderWidth = 0
    }

    
    @IBAction func yellowTap(_ sender: Any) {
        UserDefaults.standard.setColor(color: UIColor(red: 0.98, green: 0.89, blue: 0.20, alpha: 1.0), forKey: "foregroundColour")
        UserDefaults.standard.setColor(color: UIColor(red: 0.93, green: 0.31, blue: 0.13, alpha: 1.0), forKey: "backgroundColour")
        UserDefaults.standard.setColor(color: UIColor(red: 0.71, green: 0.55, blue: 0.23, alpha: 1.0), forKey: "secondaryColour")
            houseSelect = "Yellow House"
        yellowView.layer.borderWidth = 10
        yellowView.layer.borderColor = UIColor.purple.cgColor
        redView.layer.borderWidth = 0
        blueView.layer.borderWidth = 0
        greenView.layer.borderWidth = 0
        blackView.layer.borderWidth = 0
    }

    
    @IBAction func continueButton(_ sender: Any) {
        UserDefaults.standard.set("\(houseSelect)", forKey: "houseMember")
        performSegue(withIdentifier: "houseSelected", sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension UserDefaults {
    func colorForKey(key: String) -> UIColor? {
        var color: UIColor?
        if let colorData = data(forKey: key) {
            color = NSKeyedUnarchiver.unarchiveObject(with: colorData) as? UIColor
        }
        return color
    }

    func setColor(color: UIColor?, forKey key: String) {
        var colorData: NSData?
        if let color = color {
            colorData = NSKeyedArchiver.archivedData(withRootObject: color) as NSData
        }
        set(colorData, forKey: key)
    }
}
