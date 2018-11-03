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
        switch currentHouse {
        case "Black House":
            ref = Database.database().reference()
            addHouseIcon(house: "blackHouse")
            ref.child("houseInfo").child("1").child("7").observeSingleEvent(of: .value) { (snapshot) in
                houseMotto = (snapshot.value! as? String)!
                self.mottoLabel.text = houseMotto
                
        // Section 2: House Details
                self.ref.child("houseInfo").child("1").child("2").observeSingleEvent(of: .value) { (snapshot) in
                    houseCaptain = (snapshot.value! as? String)!
                    self.captainLabel.text = "House Captain:\n\(houseCaptain)"
                }
                self.ref.child("houseInfo").child("1").child("3").observeSingleEvent(of: .value) { (snapshot) in
                    viceHouseCaptain = (snapshot.value! as? String)!
                    self.viceCaptainLabel.text = "House Vice Captain:\n\(viceHouseCaptain)"
                }
                self.ref.child("houseInfo").child("1").child("4").observeSingleEvent(of: .value) { (snapshot) in
                    houseMaster = (snapshot.value! as? String)!
                    self.masterLabel.text = "House Master:\n\(houseMaster)"
                }
                self.ref.child("houseInfo").child("1").child("6").observeSingleEvent(of: .value) { (snapshot) in
                    meetingLocation = (snapshot.value! as? String)!
                    self.meetingLabel.text = "Meeting Location:\n\(meetingLocation)"
                }
            }
        case "Red House":
            ref = Database.database().reference()
            addHouseIcon(house: "redHouse")
            ref.child("houseInfo").child("2").child("7").observeSingleEvent(of: .value) { (snapshot) in
                houseMotto = (snapshot.value! as? String)!
                self.mottoLabel.text = houseMotto
        // Section 2: House Details
                self.ref.child("houseInfo").child("2").child("2").observeSingleEvent(of: .value) { (snapshot) in
                    houseCaptain = (snapshot.value! as? String)!
                    self.captainLabel.text = "House Captain:\n\(houseCaptain)"
                }
                self.ref.child("houseInfo").child("2").child("3").observeSingleEvent(of: .value) { (snapshot) in
                    viceHouseCaptain = (snapshot.value! as? String)!
                    self.viceCaptainLabel.text = "House Vice Captain:\n\(viceHouseCaptain)"
                }
            self.ref.child("houseInfo").child("2").child("4").observeSingleEvent(of: .value) { (snapshot) in
                    houseMaster = (snapshot.value! as? String)!
                    self.masterLabel.text = "House Master:\n\(houseMaster)"
                }
            self.ref.child("houseInfo").child("2").child("6").observeSingleEvent(of: .value) { (snapshot) in
                    meetingLocation = (snapshot.value! as? String)!
                    self.meetingLabel.text = "Meeting Location:\n\(meetingLocation)"
                }
            
            }
        case "Green House":
            ref = Database.database().reference()
            addHouseIcon(house: "greenHouse")
            ref.child("houseInfo").child("3").child("7").observeSingleEvent(of: .value) { (snapshot) in
                houseMotto = (snapshot.value! as? String)!
                self.mottoLabel.text = houseMotto
                
        // Section 2: House Details
                self.ref.child("houseInfo").child("3").child("2").observeSingleEvent(of: .value) { (snapshot) in
                    houseCaptain = (snapshot.value! as? String)!
                    self.captainLabel.text = "House Captain:\n\(houseCaptain)"
                }
                self.ref.child("houseInfo").child("3").child("3").observeSingleEvent(of: .value) { (snapshot) in
                    viceHouseCaptain = (snapshot.value! as? String)!
                    self.viceCaptainLabel.text = "House Vice Captain:\n\(viceHouseCaptain)"
                }
                self.ref.child("houseInfo").child("3").child("4").observeSingleEvent(of: .value) { (snapshot) in
                    houseMaster = (snapshot.value! as? String)!
                    self.masterLabel.text = "House Master:\n\(houseMaster)"
                }
                self.ref.child("houseInfo").child("3").child("6").observeSingleEvent(of: .value) { (snapshot) in
                    meetingLocation = (snapshot.value! as? String)!
                    self.meetingLabel.text = "Meeting Location:\n\(meetingLocation)"
                }
            }
        case "Blue House":
            ref = Database.database().reference()
            addHouseIcon(house: "blueHouse")
            ref.child("houseInfo").child("4").child("7").observeSingleEvent(of: .value) { (snapshot) in
                houseMotto = (snapshot.value! as? String)!
                self.mottoLabel.text = houseMotto
        //Section 2: House Details
                self.ref.child("houseInfo").child("4").child("2").observeSingleEvent(of: .value) { (snapshot) in
                    houseCaptain = (snapshot.value! as? String)!
                    self.captainLabel.text = "House Captain:\n\(houseCaptain)"
                }
                self.ref.child("houseInfo").child("4").child("3").observeSingleEvent(of: .value) { (snapshot) in
                    viceHouseCaptain = (snapshot.value! as? String)!
                    self.viceCaptainLabel.text = "House Vice Captain:\n\(viceHouseCaptain)"
                }
                self.ref.child("houseInfo").child("4").child("4").observeSingleEvent(of: .value) { (snapshot) in
                    houseMaster = (snapshot.value! as? String)!
                    self.masterLabel.text = "House Master:\n\(houseMaster)"
                }
                self.ref.child("houseInfo").child("4").child("6").observeSingleEvent(of: .value) { (snapshot) in
                    meetingLocation = (snapshot.value! as? String)!
                    self.meetingLabel.text = "Meeting Location:\n\(meetingLocation)"
                }
            }
        case "Yellow House":
            ref = Database.database().reference()
            addHouseIcon(house: "yellowHouse")
            ref.child("houseInfo").child("5").child("7").observeSingleEvent(of: .value) { (snapshot) in
                houseMotto = (snapshot.value! as? String)!
                self.mottoLabel.text = houseMotto
        //Section 2: House Details
                self.ref.child("houseInfo").child("5").child("2").observeSingleEvent(of: .value) { (snapshot) in
                    houseCaptain = (snapshot.value! as? String)!
                    self.captainLabel.text = "House Captain:\n\(houseCaptain)"
                }
                self.ref.child("houseInfo").child("5").child("3").observeSingleEvent(of: .value) { (snapshot) in
                    viceHouseCaptain = (snapshot.value! as? String)!
                    self.viceCaptainLabel.text = "House Vice Captain:\n\(viceHouseCaptain)"
                }
                self.ref.child("houseInfo").child("5").child("4").observeSingleEvent(of: .value) { (snapshot) in
                    houseMaster = (snapshot.value! as? String)!
                    self.masterLabel.text = "House Master:\n\(houseMaster)"
                }
                self.ref.child("houseInfo").child("5").child("6").observeSingleEvent(of: .value) { (snapshot) in
                    meetingLocation = (snapshot.value! as? String)!
                    self.meetingLabel.text = "Meeting Location:\n\(meetingLocation)"
                }
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
