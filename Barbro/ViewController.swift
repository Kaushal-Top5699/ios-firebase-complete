//
//  ViewController.swift
//  Barbro
//
//  Created by Kaushal Topinkatti B on 19/12/18.
//  Copyright © 2018 Kaushal Topinkatti B. All rights reserved.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class ViewController: UIViewController {

    @IBOutlet weak var mEmail: UITextField!
    
    @IBOutlet weak var mPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func btnLogIn(_ sender: Any) {
        
        if mEmail.text != "" && mPassword.text != "" {
                
            if mEmail.text!.range(of: "@") != nil && mEmail.text!.range(of: ".com") != nil {
                
                if mPassword.text!.count <= 6 {
                    
                    print("Incorrect Password!")
                    
                } else {
                    
                    Auth.auth().signIn(withEmail: mEmail.text!, password: mPassword.text!) { user, error in
                        
                        if error == nil && user != nil {
                            
                            print("Successful")
                            
                            let main = UIStoryboard(name: "Main", bundle: nil)
                            let nextViewController = main.instantiateViewController(withIdentifier: "HomeVC")
                            self.present(nextViewController, animated:true, completion:nil)
                            
                        } else {
                            
                            print(error?.localizedDescription as Any)
                            
                        }
                    }
                }
                
            } else {
                
                print("Invalid Email!")
                
            }
                
        } else {
            
            print("Email or Password Empty!, Try Again")
            
        }
    
    

    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        Auth.auth().addStateDidChangeListener { auth, user in
            
            if let user = user {
                
                if user != nil {
                    
                    print("User Logged!!")
                    
                    let main = UIStoryboard(name: "Main", bundle: nil)
                    let nextViewController = main.instantiateViewController(withIdentifier: "HomeVC")
                    self.present(nextViewController, animated:true, completion:nil)
                    
                }
                
            }
            
        }
        
    }
    
}

