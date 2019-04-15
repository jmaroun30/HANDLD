//
//  ViewController.swift
//  CreateX
//
//  Created by Chris Truong on 11/19/18.
//  Copyright © 2018 Chris Truong. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passField: UITextField!
    @IBOutlet weak var backgroundView: UIImageView!
    
    func displayAlert(title:String, message:String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func loginFunc(_ sender: Any) {
        if let email = emailField.text {
            if let pass = passField.text {
                if email == "" || pass == "" {
                    self.displayAlert(title: "Missing Information", message: "You must provide an email and password.")
                } else {
                    Auth.auth().signIn(withEmail: email, password: pass,
                                           completion: { (user, error) in
                                            if error != nil {
                                                self.displayAlert(title: "Error", message: error!.localizedDescription)
                                            } else {
                                                print("Log In Success")
                                                self.performSegue(withIdentifier: "NavSegue", sender: nil)
                                            }
                    })
                }
            }
        }
    }
    
    
    @IBAction func loginSegue(_ sender: Any) {
        if let email = emailField.text {
            if let pass = passField.text {
                if email == "" || pass == "" {
                    self.displayAlert(title: "Missing Information", message: "You must provide an email and password.")
                } else {
                    Auth.auth().createUser(withEmail: email, password: pass, completion: { (user, error) in
                        if error != nil {
                            self.displayAlert(title: "Error", message: error!.localizedDescription)
                        } else {
                            self.performSegue(withIdentifier: "NavSegue", sender: self)
                            print("Success!")
                        }
                    })
                }
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //backgroundView.image = UIImage(named: "Background_Rach2.png")
        
    }


}

