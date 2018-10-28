//
//  HouseSelectionViewController.swift
//  SST House Points App
//
//  Created by Sebastian Choo on 11/8/18.
//  Copyright © 2018 SebastianChoo.Co. All rights reserved.
//

//User Default
//User Default

import UIKit

class HouseSelectionViewController: UIViewController {


    @IBOutlet weak var blackButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!

    @IBAction func blackPressed(_ sender: Any) {
        UserDefaults.standard.setColor(color: UIColor(red: 0.01, green: 0.01, blue: 0.01, alpha: 1.0), forKey: "foregroundColour")
        UserDefaults.standard.setColor(color: UIColor(red: 0.41, green: 0.79, blue: 0.62, alpha: 1.0), forKey: "backgroundColour")
        UserDefaults.standard.setColor(color: UIColor(red: 0.16, green: 0.16, blue: 0.16, alpha: 1.0), forKey: "secondaryColour")
        UserDefaults.standard.set("Black House", forKey: "houseMember")
        performSegue(withIdentifier: "colourSelected", sender: sender)
    }

    @IBAction func redPressed(_ sender: Any) {
        UserDefaults.standard.setColor(color: UIColor(red: 0.93, green: 0.13, blue: 0.05, alpha: 1.0), forKey: "foregroundColour")
        UserDefaults.standard.setColor(color: UIColor(red: 0.35, green: 0.47, blue: 0.57, alpha: 1.0), forKey: "backgroundColour")
        UserDefaults.standard.setColor(color: UIColor(red: 0.62, green: 0.25, blue: 0.22, alpha: 1.0), forKey: "secondaryColour")
        UserDefaults.standard.set("Red House", forKey: "houseMember")
        performSegue(withIdentifier: "colourSelected", sender: sender)
    }

    @IBAction func bluePressed(_ sender: Any) {
        UserDefaults.standard.setColor(color: UIColor(red: 0.00, green: 0.64, blue: 1.00, alpha: 1.0), forKey: "foregroundColour")
        UserDefaults.standard.setColor(color: UIColor(red: 0.09, green: 0.04, blue: 0.11, alpha: 1.0), forKey: "backgroundColour")
        UserDefaults.standard.setColor(color: UIColor(red: 0.00, green: 0.46, blue: 0.73, alpha: 1.0), forKey: "secondaryColour")
        UserDefaults.standard.set("Blue House", forKey: "houseMember")
        performSegue(withIdentifier: "colourSelected", sender: sender)
    }

    @IBAction func greenPressed(_ sender: Any) {
        UserDefaults.standard.setColor(color: UIColor(red: 0.00, green: 0.60, blue: 0.00, alpha: 1.0), forKey: "foregroundColour")
        UserDefaults.standard.setColor(color: UIColor(red: 0.93, green: 0.38, blue: 0.33, alpha: 1.0), forKey: "backgroundColour")
        UserDefaults.standard.setColor(color: UIColor(red: 0.00, green: 0.44, blue: 0.00, alpha: 1.0), forKey: "secondaryColour")
        UserDefaults.standard.set("Green House", forKey: "houseMember")
        performSegue(withIdentifier: "colourSelected", sender: sender)
    }

    @IBAction func yellowPressed(_ sender: Any) {
        UserDefaults.standard.setColor(color: UIColor(red: 0.98, green: 0.89, blue: 0.20, alpha: 1.0), forKey: "foregroundColour")
        UserDefaults.standard.setColor(color: UIColor(red: 0.93, green: 0.31, blue: 0.13, alpha: 1.0), forKey: "backgroundColour")
        UserDefaults.standard.setColor(color: UIColor(red: 0.71, green: 0.55, blue: 0.23, alpha: 1.0), forKey: "secondaryColour")
        UserDefaults.standard.set("Yellow House", forKey: "houseMember")
        performSegue(withIdentifier: "colourSelected", sender: sender)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Config Buttons
        blackButton.backgroundColor = .black
        redButton.backgroundColor = UIColor(red: 0.93, green: 0.13, blue: 0.05, alpha: 1.0)
        blueButton.backgroundColor = UIColor(red: 0.00, green: 0.64, blue: 1.00, alpha: 1.0)
        greenButton.backgroundColor = UIColor(red: 0.00, green: 0.60, blue: 0.00, alpha: 1.0)
        yellowButton.backgroundColor = UIColor(red: 0.98, green: 0.89, blue: 0.20, alpha: 1.0)
        blackButton.layer.cornerRadius = 10
        redButton.layer.cornerRadius = 10
        blueButton.layer.cornerRadius = 10
        greenButton.layer.cornerRadius = 10
        yellowButton.layer.cornerRadius = 10
        let layer = CAGradientLayer()
        layer.frame = view.bounds
        view.layer.addSublayer(layer)
        layer.colors = [UIColor(red: 0.08, green: 0.08, blue: 0.08, alpha: 1.0).cgColor, UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0).cgColor, UIColor(red: 0.08, green: 0.08, blue: 0.08, alpha: 1.0).cgColor]
        layer.startPoint = CGPoint(x: 0, y: 0)
        layer.endPoint = CGPoint(x: 1, y: 1)
        layer.opacity = 0.85
        layer.zPosition = -1

        let layer1 = CAGradientLayer()
        layer1.frame = view.bounds
        view.layer.addSublayer(layer1)
        layer1.colors = [UIColor(red: 0.08, green: 0.08, blue: 0.08, alpha: 1.0).cgColor, UIColor(red: 0.60, green: 0.60, blue: 0.60, alpha: 1.0).cgColor, UIColor(red: 0.08, green: 0.08, blue: 0.08, alpha: 1.0).cgColor]
        layer1.startPoint = CGPoint(x: 1, y: 0)
        layer1.endPoint = CGPoint(x: 0, y: 1)
        layer1.opacity = 0.85
        layer1.zPosition = -1
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
