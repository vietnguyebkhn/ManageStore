//
//  LoginViewController.swift
//  ManageStore
//
//  Created by Nguyễn Việt on 10/2/18.
//  Copyright © 2018 Việt Nguyễn. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class LoginViewController: UIViewController {
    
    
    @IBOutlet weak var mPassword: UITextField!
    @IBOutlet weak var mAccount: UITextField!
    
    
    @IBOutlet weak var mLogin: UIButton!
    
    @IBAction func mLoginTouched(_ sender: Any) {
 
        if (self.mAccount.text != "" && self.mPassword.text != "") {
             Auth.auth().signIn(withEmail: self.mAccount.text!, password: self.mPassword.text!) { (user, error) in
                if error == nil {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let MainVC = storyboard.instantiateViewController(withIdentifier: "UITabBarController-LIJ-yF-sd1")
                self.present(MainVC, animated: true, completion: nil)
                            }
                        }
                    }
                }

    
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if let users = user {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let MainVC = storyboard.instantiateViewController(withIdentifier: "UITabBarController-LIJ-yF-sd1")
                self.present(MainVC, animated: true, completion: nil)
            } else {
                return
            }
        }
    }
    

  
}
