//
//  CurrentHouseViewController.swift
//  SST House Points App
//
//  Created by Sebastian Choo on 7/11/18.
//  Copyright © 2018 SebastianChoo.Co. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Firebase

class CurrentHouseViewController: UIViewController {

    let currentHouse = "\(UserDefaults.standard.object(forKey: "houseMember") ?? "No House")"
    let alert = UIAlertController(title: "Connection Error", message: "Please check your connection and try again.", preferredStyle: .alert)
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var iconLabel: UIImageView!
    @IBOutlet weak var mottoLabel: UILabel!
    @IBOutlet weak var captainLabel: UILabel!
    @IBOutlet weak var viceCaptainLabel: UILabel!
    @IBOutlet weak var masterLabel: UILabel!
    @IBOutlet weak var meetingLabel: UILabel!
    
    
    let backgroundBlack: UIImage = UIImage(named: "LongBackgrounds.002")!
    let backgroundYellow: UIImage = UIImage(named: "LongBackgrounds.005")!
    let backgroundGreen: UIImage = UIImage(named: "LongBackgrounds.004")!
    let backgroundRed: UIImage = UIImage(named: "LongBackgrounds.003")!
    let backgroundBlue: UIImage = UIImage(named: "LongBackgrounds.001")!
    
    var houseMotto: String!
    var houseCaptain: String!
    var viceHouseCaptain: String!
    var meetingLocation: String!
    var houseMaster: String!
    
    var ref: DatabaseReference!
    
    func addHouseIcon(house: String) {
        var icon: UIImage!
        icon = UIImage(named: house)
        iconLabel.image = icon
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let connectedRef = Database.database().reference(withPath: ".info/connected")
        connectedRef.observe(.value, with: { snapshot in
            if snapshot.value as? Bool ?? false {
                print("Connected")
            } else {
                print("Not connected")
                self.alert.addAction(UIAlertAction(title: NSLocalizedString("Dismiss", comment: "Default action"), style: .default, handler: { _ in
                    NSLog("The \"OK\" alert occured.")
                }))
                self.present(self.alert, animated: true, completion: nil)
            }
        })

        
        switch currentHouse {
        case "Black House":
            ref = Database.database().reference()
            addHouseIcon(house: "blackHouse")
            
            backgroundImage.image = backgroundBlack
            
            ref.child("houseInfo").child("1").child("6").observeSingleEvent(of: .value) { (snapshot) in
                self.houseMotto = (snapshot.value! as? String)!
                self.mottoLabel.text = "\"\(self.houseMotto ?? "")\""
                }
            self.ref.child("houseInfo").child("1").child("2").observeSingleEvent(of: .value) { (snapshot) in
                    self.houseCaptain = (snapshot.value! as? String)!
                    self.captainLabel.text = self.houseCaptain
                }
                self.ref.child("houseInfo").child("1").child("3").observeSingleEvent(of: .value) { (snapshot) in
                    self.viceHouseCaptain = (snapshot.value! as? String)!
                    self.viceCaptainLabel.text = self.viceHouseCaptain
                }
                self.ref.child("houseInfo").child("1").child("4").observeSingleEvent(of: .value) { (snapshot) in
                    self.houseMaster = (snapshot.value! as? String)!
                    self.masterLabel.text = self.houseMaster
                }
                self.ref.child("houseInfo").child("1").child("5").observeSingleEvent(of: .value) { (snapshot) in
                    self.meetingLocation = (snapshot.value! as? String)!
                    self.meetingLabel.text = self.meetingLocation
                }
        case "Red House":
            ref = Database.database().reference()
            addHouseIcon(house: "redHouse")
            
            backgroundImage.image = backgroundRed
            
            ref.child("houseInfo").child("2").child("6").observeSingleEvent(of: .value) { (snapshot) in
                self.houseMotto = (snapshot.value! as? String)!
                self.mottoLabel.text = "\"\(self.houseMotto ?? "")\""
                // Section 2: House Details
                self.ref.child("houseInfo").child("2").child("2").observeSingleEvent(of: .value) { (snapshot) in
                    self.houseCaptain = (snapshot.value! as? String)!
                    self.captainLabel.text = self.houseCaptain
                }
                self.ref.child("houseInfo").child("2").child("3").observeSingleEvent(of: .value) { (snapshot) in
                    self.viceHouseCaptain = (snapshot.value! as? String)!
                    self.viceCaptainLabel.text = self.viceHouseCaptain
                }
                self.ref.child("houseInfo").child("2").child("4").observeSingleEvent(of: .value) { (snapshot) in
                    self.houseMaster = (snapshot.value! as? String)!
                    self.masterLabel.text = self.houseMaster
                }
                self.ref.child("houseInfo").child("2").child("5").observeSingleEvent(of: .value) { (snapshot) in
                    self.meetingLocation = (snapshot.value! as? String)!
                    self.meetingLabel.text = self.meetingLocation
                }
                
            }
        case "Green House":
            ref = Database.database().reference()
            
            backgroundImage.image = backgroundGreen
            
            addHouseIcon(house: "greenHouse")
            ref.child("houseInfo").child("3").child("6").observeSingleEvent(of: .value) { (snapshot) in
                self.houseMotto = (snapshot.value! as? String)!
                self.mottoLabel.text = "\"\(self.houseMotto ?? "")\""
                
                // Section 2: House Details
                self.ref.child("houseInfo").child("3").child("2").observeSingleEvent(of: .value) { (snapshot) in
                    self.houseCaptain = (snapshot.value! as? String)!
                    self.captainLabel.text = self.houseCaptain
                }
                self.ref.child("houseInfo").child("3").child("3").observeSingleEvent(of: .value) { (snapshot) in
                    self.viceHouseCaptain = (snapshot.value! as? String)!
                    self.viceCaptainLabel.text = self.viceHouseCaptain
                }
                self.ref.child("houseInfo").child("3").child("4").observeSingleEvent(of: .value) { (snapshot) in
                    self.houseMaster = (snapshot.value! as? String)!
                    self.masterLabel.text = self.houseMaster
                }
                self.ref.child("houseInfo").child("3").child("5").observeSingleEvent(of: .value) { (snapshot) in
                    self.meetingLocation = (snapshot.value! as? String)!
                    self.meetingLabel.text = self.meetingLocation
                }
            }
        case "Blue House":
            ref = Database.database().reference()
            addHouseIcon(house: "blueHouse")
            
            backgroundImage.image = backgroundBlue

            ref.child("houseInfo").child("4").child("6").observeSingleEvent(of: .value) { (snapshot) in
                self.houseMotto = (snapshot.value! as? String)!
                self.mottoLabel.text = self.houseMotto
                //Section 2: House Details
                self.ref.child("houseInfo").child("4").child("2").observeSingleEvent(of: .value) { (snapshot) in
                    self.houseCaptain = (snapshot.value! as? String)!
                    self.captainLabel.text = self.houseCaptain
                }
                self.ref.child("houseInfo").child("4").child("3").observeSingleEvent(of: .value) { (snapshot) in
                    self.viceHouseCaptain = (snapshot.value! as? String)!
                    self.viceCaptainLabel.text = self.viceHouseCaptain
                }
                self.ref.child("houseInfo").child("4").child("4").observeSingleEvent(of: .value) { (snapshot) in
                    self.houseMaster = (snapshot.value! as? String)!
                    self.masterLabel.text = self.houseMaster
                }
                self.ref.child("houseInfo").child("4").child("5").observeSingleEvent(of: .value) { (snapshot) in
                    self.meetingLocation = (snapshot.value! as? String)!
                    self.meetingLabel.text = self.meetingLocation
                }
            }
        case "Yellow House":
            ref = Database.database().reference()
            addHouseIcon(house: "yellowHouse")
            
            backgroundImage.image = backgroundYellow

            ref.child("houseInfo").child("5").child("6").observeSingleEvent(of: .value) { (snapshot) in
                self.houseMotto = (snapshot.value! as? String)!
                self.mottoLabel.text = self.houseMotto
                //Section 2: House Details
                self.ref.child("houseInfo").child("5").child("2").observeSingleEvent(of: .value) { (snapshot) in
                    self.houseCaptain = (snapshot.value! as? String)!
                    self.captainLabel.text = self.houseCaptain
                }
                self.ref.child("houseInfo").child("5").child("3").observeSingleEvent(of: .value) { (snapshot) in
                    self.viceHouseCaptain = (snapshot.value! as? String)!
                    self.viceCaptainLabel.text = self.viceHouseCaptain
                }
                self.ref.child("houseInfo").child("5").child("4").observeSingleEvent(of: .value) { (snapshot) in
                    self.houseMaster = (snapshot.value! as? String)!
                    self.masterLabel.text = self.houseMaster
                }
                self.ref.child("houseInfo").child("5").child("5").observeSingleEvent(of: .value) { (snapshot) in
                    self.meetingLocation = (snapshot.value! as? String)!
                    self.meetingLabel.text = self.meetingLocation
                }
            }
        default:
           return
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
