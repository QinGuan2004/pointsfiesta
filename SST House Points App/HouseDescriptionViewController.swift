//
//  HouseDescriptionViewController.swift
//  SST House Points App
//
//  Created by Sebastian Choo on 4/8/18.
//  Copyright © 2018 SebastianChoo.Co. All rights reserved.
//

import UIKit
import FirebaseDatabase

class HouseDescriptionViewController: UIViewController {

    let foregroundColour = UserDefaults.standard.colorForKey(key: "foregroundColour")
    let backgroundColour = UserDefaults.standard.colorForKey(key: "backgroundColour")
    let secondaryColour = UserDefaults.standard.colorForKey(key: "secondaryColour")
    let currentHouse = "\(UserDefaults.standard.object(forKey: "houseMember") ?? "No House")"

    @IBOutlet weak var descriptionView: UIView!
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var houseLabel: UILabel!
    @IBOutlet weak var masterLabel: UILabel!
    @IBOutlet weak var captainLabel: UILabel!
    @IBOutlet weak var viceCaptainLabel: UILabel!
    @IBOutlet weak var meetingLabel: UILabel!
    @IBOutlet weak var mottoLabel: UILabel!
    var ref: DatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        //Testing Connections
        ref = Database.database().reference()

        //Loading View
        view.backgroundColor = backgroundColour
        mainView.backgroundColor = secondaryColour
        mainView.layer.cornerRadius = 30
        descriptionView.layer.cornerRadius = 30
        descriptionView.backgroundColor = foregroundColour
        houseLabel.textColor = .white
        masterLabel.textColor = .white
        captainLabel.textColor = .white
        viceCaptainLabel.textColor = .white
        meetingLabel.textColor = .white
        mottoLabel.textColor = .white
        //Loading Data

        var houseCaptain = ""
        var viceHouseCaptain = ""
        var houseMaster = ""
        var meetingLocation = ""
        var houseMotto = ""

        houseLabel.text = "\(currentHouse)"

        if currentHouse == "Black House" {
            ref.child("houseInfo").child("1").child("2").observeSingleEvent(of: .value) { (snapshot) in
                houseCaptain = (snapshot.value! as? String)!
                self.captainLabel.text = "House Captain:\n\(houseCaptain)"
            }
            ref.child("houseInfo").child("1").child("3").observeSingleEvent(of: .value) { (snapshot) in
                viceHouseCaptain = (snapshot.value! as? String)!
                self.viceCaptainLabel.text = "House Vice Captain:\n\(viceHouseCaptain)"
            }
            ref.child("houseInfo").child("1").child("4").observeSingleEvent(of: .value) { (snapshot) in
                houseMaster = (snapshot.value! as? String)!
                self.masterLabel.text = "House Master:\n\(houseMaster)"
            }
            ref.child("houseInfo").child("1").child("6").observeSingleEvent(of: .value) { (snapshot) in
                meetingLocation = (snapshot.value! as? String)!
                self.meetingLabel.text = "Meeting Location:\n\(meetingLocation)"
            }
            ref.child("houseInfo").child("1").child("7").observeSingleEvent(of: .value) { (snapshot) in
                houseMotto = (snapshot.value! as? String)!
                self.mottoLabel.text = "House Motto:\n\(houseMotto)"
            }
        } else if currentHouse == "Red House" {
            ref.child("houseInfo").child("2").child("2").observeSingleEvent(of: .value) { (snapshot) in
                houseCaptain = (snapshot.value! as? String)!
                self.captainLabel.text = "House Captain:\n\(houseCaptain)"
            }
            ref.child("houseInfo").child("2").child("3").observeSingleEvent(of: .value) { (snapshot) in
                viceHouseCaptain = (snapshot.value! as? String)!
                self.viceCaptainLabel.text = "House Vice Captain:\n\(viceHouseCaptain)"
            }
            ref.child("houseInfo").child("2").child("4").observeSingleEvent(of: .value) { (snapshot) in
                houseMaster = (snapshot.value! as? String)!
                self.masterLabel.text = "House Master:\n\(houseMaster)"
            }
            ref.child("houseInfo").child("2").child("6").observeSingleEvent(of: .value) { (snapshot) in
                meetingLocation = (snapshot.value! as? String)!
                self.meetingLabel.text = "Meeting Location:\n\(meetingLocation)"
            }
            ref.child("houseInfo").child("2").child("7").observeSingleEvent(of: .value) { (snapshot) in
                houseMotto = (snapshot.value! as? String)!
                self.mottoLabel.text = "House Motto:\n\(houseMotto)"
            }
        } else if currentHouse == "Green House" {
            ref.child("houseInfo").child("3").child("2").observeSingleEvent(of: .value) { (snapshot) in
                houseCaptain = (snapshot.value! as? String)!
                self.captainLabel.text = "House Captain:\n\(houseCaptain)"
            }
            ref.child("houseInfo").child("3").child("3").observeSingleEvent(of: .value) { (snapshot) in
                viceHouseCaptain = (snapshot.value! as? String)!
                self.viceCaptainLabel.text = "House Vice Captain:\n\(viceHouseCaptain)"
            }
            ref.child("houseInfo").child("3").child("4").observeSingleEvent(of: .value) { (snapshot) in
                houseMaster = (snapshot.value! as? String)!
                self.masterLabel.text = "House Master:\n\(houseMaster)"
            }
            ref.child("houseInfo").child("3").child("6").observeSingleEvent(of: .value) { (snapshot) in
                meetingLocation = (snapshot.value! as? String)!
                self.meetingLabel.text = "Meeting Location:\n\(meetingLocation)"
            }
            ref.child("houseInfo").child("3").child("7").observeSingleEvent(of: .value) { (snapshot) in
                houseMotto = (snapshot.value! as? String)!
                self.mottoLabel.text = "House Motto:\n\(houseMotto)"
            }
        } else if currentHouse == "Blue House" {
            ref.child("houseInfo").child("4").child("2").observeSingleEvent(of: .value) { (snapshot) in
                houseCaptain = (snapshot.value! as? String)!
                self.captainLabel.text = "House Captain:\n\(houseCaptain)"
            }
            ref.child("houseInfo").child("4").child("3").observeSingleEvent(of: .value) { (snapshot) in
                viceHouseCaptain = (snapshot.value! as? String)!
                self.viceCaptainLabel.text = "House Vice Captain:\n\(viceHouseCaptain)"
            }
            ref.child("houseInfo").child("4").child("4").observeSingleEvent(of: .value) { (snapshot) in
                houseMaster = (snapshot.value! as? String)!
                self.masterLabel.text = "House Master:\n\(houseMaster)"
            }
            ref.child("houseInfo").child("4").child("6").observeSingleEvent(of: .value) { (snapshot) in
                meetingLocation = (snapshot.value! as? String)!
                self.meetingLabel.text = "Meeting Location:\n\(meetingLocation)"
            }
            ref.child("houseInfo").child("4").child("7").observeSingleEvent(of: .value) { (snapshot) in
                houseMotto = (snapshot.value! as? String)!
                self.mottoLabel.text = "House Motto:\n\(houseMotto)"
            }
        } else if currentHouse == "Yellow House" {
            ref.child("houseInfo").child("5").child("2").observeSingleEvent(of: .value) { (snapshot) in
                houseCaptain = (snapshot.value! as? String)!
                self.captainLabel.text = "House Captain:\n\(houseCaptain)"
            }
            ref.child("houseInfo").child("5").child("3").observeSingleEvent(of: .value) { (snapshot) in
                viceHouseCaptain = (snapshot.value! as? String)!
                self.viceCaptainLabel.text = "House Vice Captain:\n\(viceHouseCaptain)"
            }
            ref.child("houseInfo").child("5").child("4").observeSingleEvent(of: .value) { (snapshot) in
                houseMaster = (snapshot.value! as? String)!
                self.masterLabel.text = "House Master:\n\(houseMaster)"
            }
            ref.child("houseInfo").child("5").child("6").observeSingleEvent(of: .value) { (snapshot) in
                meetingLocation = (snapshot.value! as? String)!
                self.meetingLabel.text = "Meeting Location:\n\(meetingLocation)"
            }
            ref.child("houseInfo").child("5").child("7").observeSingleEvent(of: .value) { (snapshot) in
                houseMotto = (snapshot.value! as? String)!
                self.mottoLabel.text = "House Motto:\n\(houseMotto)"
            }
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
