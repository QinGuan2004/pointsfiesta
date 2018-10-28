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

    let foregroundColour = UserDefaults.standard.colorForKey(key: "foregroundColour")
    let backgroundColour = UserDefaults.standard.colorForKey(key: "backgroundColour")
    let secondaryColour = UserDefaults.standard.colorForKey(key: "secondaryColour")

    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var allView: UIView!
    @IBOutlet weak var blackPoints: UILabel!
    @IBOutlet weak var bluePoints: UILabel!
    @IBOutlet weak var greenPoints: UILabel!
    @IBOutlet weak var redPoints: UILabel!
    @IBOutlet weak var yellowPoints: UILabel!

    var ref: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        //Loading the view
        view.backgroundColor = backgroundColour
        mainView.backgroundColor = secondaryColour
        allView.backgroundColor = foregroundColour
        mainView.layer.cornerRadius = 30
        allView.layer.cornerRadius = 30
        // Do any additional setup after loading the view.
        //Downloading Points from Database
        ref = Database.database().reference()
        ref.child("houseInfo").child("1").child("1").observeSingleEvent(of: .value) { (snapshot) in
            let black = (snapshot.value! as? Int)!
            self.blackPoints.text = "\(black) points"
        }
        ref.child("houseInfo").child("2").child("1").observeSingleEvent(of: .value) { (snapshot) in
            let red = (snapshot.value! as? Int)!
            self.redPoints.text = "\(red) points"
        }
        ref.child("houseInfo").child("3").child("1").observeSingleEvent(of: .value) { (snapshot) in
            let green = (snapshot.value! as? Int)!
            self.greenPoints.text = "\(green) points"
        }
        ref.child("houseInfo").child("4").child("1").observeSingleEvent(of: .value) { (snapshot) in
            let blue = (snapshot.value! as? Int)!
            self.bluePoints.text = "\(blue) points"
        }
        ref.child("houseInfo").child("5").child("1").observeSingleEvent(of: .value) { (snapshot) in
            let yellow = (snapshot.value! as? Int)!
            self.yellowPoints.text = "\(yellow) points"
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
