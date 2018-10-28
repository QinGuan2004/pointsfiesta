//
//  AnnouncementViewController.swift
//  SST House Points App
//
//  Created by Sebastian Choo on 26/8/18.
//  Copyright © 2018 SebastianChoo.Co. All rights reserved.
//
//ref.child("houseInfo").child("5").child("1").observeSingleEvent(of: .value) { (snapshot) in
//    points = (snapshot.value! as? Int)!
//}

import UIKit
import FirebaseDatabase

class AnnouncementViewController: UIViewController {

    let foregroundColour = UserDefaults.standard.colorForKey(key: "foregroundColour")
    let backgroundColour = UserDefaults.standard.colorForKey(key: "backgroundColour")
    let secondaryColour = UserDefaults.standard.colorForKey(key: "secondaryColour")
    let currentHouse = "\(UserDefaults.standard.object(forKey: "houseMember") ?? "No House")"

    var ref: DatabaseReference!
    var HouseTitle: String = ""
    var HouseContent: String = ""
    var allTitle1: String = ""
    var allContent1: String = ""
    var allTitle2: String = ""
    var allContent2: String = ""
    var allTitle3: String = ""
    var allContent3: String = ""
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var allView: UIView!

    //Announcement Labels

    @IBOutlet weak var houseTitle: UILabel!
    @IBOutlet weak var houseContent: UILabel!
    @IBOutlet weak var all1Title: UILabel!
    @IBOutlet weak var all1Content: UILabel!
    @IBOutlet weak var all2Title: UILabel!
    @IBOutlet weak var all2Content: UILabel!
    @IBOutlet weak var all3Title: UILabel!
    @IBOutlet weak var all3Content: UILabel!

    func getAnnouncement() {

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //Downloading from Firebase
        ref = Database.database().reference()
        switch currentHouse {
        case "Black House":
            ref.child("announcementSent").child("1").child("1").observeSingleEvent(of: .value) { (snapshot) in
                self.HouseTitle = (snapshot.value! as? String)!
                self.houseTitle.text = self.HouseTitle
            }
            ref.child("announcementSent").child("1").child("2").observeSingleEvent(of: .value) { (snapshot) in
                self.HouseContent = (snapshot.value! as? String)!
                self.houseContent.text = self.HouseContent
            }
        case "Red House":
            ref.child("announcementSent").child("2").child("1").observeSingleEvent(of: .value) { (snapshot) in
                self.HouseTitle = (snapshot.value! as? String)!
                self.houseTitle.text = self.HouseTitle
            }
            ref.child("announcementSent").child("2").child("2").observeSingleEvent(of: .value) { (snapshot) in
                self.HouseContent = (snapshot.value! as? String)!
                self.houseContent.text = self.HouseContent
            }
        case "Green House":
            ref.child("announcementSent").child("3").child("1").observeSingleEvent(of: .value) { (snapshot) in
                self.HouseTitle = (snapshot.value! as? String)!
                self.houseTitle.text = self.HouseTitle
            }
            ref.child("announcementSent").child("3").child("2").observeSingleEvent(of: .value) { (snapshot) in
                self.HouseContent = (snapshot.value! as? String)!
                self.houseContent.text = self.HouseContent
            }
        case "Blue House":
            ref.child("announcementSent").child("4").child("1").observeSingleEvent(of: .value) { (snapshot) in
                self.HouseTitle = (snapshot.value! as? String)!
                self.houseTitle.text = self.HouseTitle
            }
            ref.child("announcementSent").child("4").child("2").observeSingleEvent(of: .value) { (snapshot) in
                self.HouseContent = (snapshot.value! as? String)!
                self.houseContent.text = self.HouseContent
            }
        case "Yellow House":
            ref.child("announcementSent").child("5").child("1").observeSingleEvent(of: .value) { (snapshot) in
                self.HouseTitle = (snapshot.value! as? String)!
                self.houseTitle.text = self.HouseTitle
            }
            ref.child("announcementSent").child("5").child("2").observeSingleEvent(of: .value) { (snapshot) in
                self.HouseContent = (snapshot.value! as? String)!
                self.houseContent.text = self.HouseContent
            }
        default:
            houseTitle.text = "Error"
            houseContent.text = "Error"
        }
        ref.child("announcementSent").child("6").child("1").observeSingleEvent(of: .value) { (snapshot) in
            self.allTitle1 = (snapshot.value! as? String)!
            self.all1Title.text = self.allTitle1
        }
        ref.child("announcementSent").child("6").child("2").observeSingleEvent(of: .value) { (snapshot) in
            self.allContent1 = (snapshot.value! as? String)!
            self.all1Content.text = self.allContent1
        }
        ref.child("announcementSent").child("7").child("1").observeSingleEvent(of: .value) { (snapshot) in
            self.allTitle2 = (snapshot.value! as? String)!
            self.all2Title.text = self.allTitle2
        }
        ref.child("announcementSent").child("7").child("2").observeSingleEvent(of: .value) { (snapshot) in
            self.allContent2 = (snapshot.value! as? String)!
            self.all2Content.text = self.allContent2
        }
        ref.child("announcementSent").child("8").child("1").observeSingleEvent(of: .value) { (snapshot) in
            self.allTitle3 = (snapshot.value! as? String)!
            self.all3Title.text = self.allTitle3
        }
        ref.child("announcementSent").child("8").child("2").observeSingleEvent(of: .value) { (snapshot) in
            self.allContent3 = (snapshot.value! as? String)!
            self.all3Content.text = self.allContent3

        }        // Loading View
        view.backgroundColor = backgroundColour
        mainView.layer.cornerRadius = 30
        mainView.backgroundColor = secondaryColour
        allView.backgroundColor = foregroundColour
        allView.layer.cornerRadius = 30
        // Do any additional setup after loading the view.
        //Loading Announcements
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
