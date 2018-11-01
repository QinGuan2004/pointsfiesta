//
//  SignInViewController.swift
//  SST House Points App
//
//  Created by Sebastian Choo on 6/8/18.
//  Copyright © 2018 SebastianChoo.Co. All rights reserved.
//

import UIKit
import GoogleSignIn
import FirebaseAuth

class SignInViewController: UIViewController, GIDSignInUIDelegate, GIDSignInDelegate {


    @IBOutlet weak var Points: UILabel!
    @IBOutlet var googleSignInButton: GIDSignInButton!

    @IBAction func didTapSignOut(_ sender: AnyObject) {
        GIDSignIn.sharedInstance()?.signOut()
    }

    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        if let error = error {
            print("\(error.localizedDescription)")
        } else {
            // Perform any operations on signed in user here.
            print("Successful!")
            UserDefaults.standard.set(user.userID, forKey: "userID") // For client-side use only!
            UserDefaults.standard.set(user.authentication.idToken, forKey: "authenticationToken") // Safe to send to the server
            UserDefaults.standard.set(user.profile.name, forKey: "name")
            UserDefaults.standard.set(user.profile.email, forKey: "email")
            // ...
            guard let authentication = user.authentication else {
                return
            }
            let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
            Auth.auth().signInAndRetrieveData(with: credential) { (authResult, error) in
                if let error = error {
                    print("\(error.localizedDescription)")
                    return
                }

                self.performSegue(withIdentifier: "signInDone", sender: self)
                // User is signed in
                // ...
            }
        }

    }

    @IBAction func googleButtonTapped(_ sender: Any) {
        GIDSignIn.sharedInstance().signIn()
        performSegue(withIdentifier: "signInDone", sender: sender)
        print("Test")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        Points.text = "Points\n This app hopes to increase the House Culture in SST."
// Setting Background Colour (Gradient)
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
        googleSignInButton.style = .wide
        googleSignInButton.colorScheme = .dark
        // Do any additional setup after loading the view.
        GIDSignIn.sharedInstance().clientID = "803179619735-g2pqb4rvenqpj9vrqsj98hqib19ioh0m.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
        GIDSignIn.sharedInstance().uiDelegate = self
    }

    // ...
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */

}
