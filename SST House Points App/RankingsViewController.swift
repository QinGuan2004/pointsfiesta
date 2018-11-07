//
//  RankingsViewController.swift
//  SST House Points App
//
//  Created by Sebastian Choo on 4/8/18.
//  Copyright © 2018 SebastianChoo.Co. All rights reserved.
//

import UIKit
import FirebaseDatabase

class RankingsViewController: UIViewController {

    @IBOutlet weak var allView: UIView!
    @IBOutlet weak var blackPoints: UILabel!
    @IBOutlet weak var bluePoints: UILabel!
    @IBOutlet weak var greenPoints: UILabel!
    @IBOutlet weak var redPoints: UILabel!
    @IBOutlet weak var yellowPoints: UILabel!
    
    @IBOutlet weak var backgroundImage: UIImageView!
    
    @IBOutlet weak var blackView: UIView!
    @IBOutlet weak var blueView: UIView!
    @IBOutlet weak var greenView: UIView!
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowView: UIView!
    
    let backgroundBlack: UIImage = UIImage(named: "ShortBackground.002")!
    let backgroundYellow: UIImage = UIImage(named: "ShortBackground.005")!
    let backgroundGreen: UIImage = UIImage(named: "ShortBackground.004")!
    let backgroundRed: UIImage = UIImage(named: "ShortBackground.003")!
    let backgroundBlue: UIImage = UIImage(named: "ShortBackground.001")!
    
    let currentHouse = "\(UserDefaults.standard.object(forKey: "houseMember") ?? "No House")"


    var ref: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        blackView.layer.cornerRadius = 20
        blueView.layer.cornerRadius = 20
        redView.layer.cornerRadius = 20
        greenView.layer.cornerRadius = 20
        yellowView.layer.cornerRadius = 20
        
        switch currentHouse {
        case "Black House":
            backgroundImage.image = backgroundBlack
        case "Red House":
            backgroundImage.image = backgroundRed
        case "Yellow House":
            backgroundImage.image = backgroundYellow
        case "Blue House":
            backgroundImage.image = backgroundBlue
        case "Green House":
            backgroundImage.image = backgroundGreen
        default:
            return 
        }
        
        // Do any additional setup after loading the view.
        //Downloading Points from Database
        ref = Database.database().reference()
        ref.child("houseInfo").child("1").child("1").observeSingleEvent(of: .value) { (snapshot) in
            let black = (snapshot.value! as? Int)!
            self.blackPoints.text = "\(black)"
        }
        ref.child("houseInfo").child("2").child("1").observeSingleEvent(of: .value) { (snapshot) in
            let red = (snapshot.value! as? Int)!
            self.redPoints.text = "\(red)"
        }
        ref.child("houseInfo").child("3").child("1").observeSingleEvent(of: .value) { (snapshot) in
            let green = (snapshot.value! as? Int)!
            self.greenPoints.text = "\(green)"
        }
        ref.child("houseInfo").child("4").child("1").observeSingleEvent(of: .value) { (snapshot) in
            let blue = (snapshot.value! as? Int)!
            self.bluePoints.text = "\(blue)"
        }
        ref.child("houseInfo").child("5").child("1").observeSingleEvent(of: .value) { (snapshot) in
            let yellow = (snapshot.value! as? Int)!
            self.yellowPoints.text = "\(yellow)"
        }
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
