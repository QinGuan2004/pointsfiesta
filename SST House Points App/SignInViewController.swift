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

    @IBOutlet var googleSignInButton: GIDSignInButton!

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
        
        GIDSignIn.sharedInstance().uiDelegate = self
        // Do any additional setup after loading the view.
        GIDSignIn.sharedInstance().clientID = "803179619735-g2pqb4rvenqpj9vrqsj98hqib19ioh0m.apps.googleusercontent.com"
        GIDSignIn.sharedInstance().delegate = self
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
