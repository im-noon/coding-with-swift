//
//  RegisterViewController.swift
//  Flash Chat
//
//  Created by Slimn Srarena on 17/9/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD
class RegisterViewController: UIViewController {

    @IBOutlet var textfieldEmail: UITextField!
    @IBOutlet var textfieldPassword: UITextField!


    override func viewDidLoad() {
        super.viewDidLoad()

    }


    @IBAction func registerButtonPressed(_ sender: UIButton) {

        SVProgressHUD.show()
        //TODO: Set up a new user on our Firbase database
        Auth.auth().createUser(withEmail: textfieldEmail.text!,
                               password: textfieldPassword.text!)
        { authResult, error in
            if (error != nil) {
                debugPrint(error!)
                SVProgressHUD.dismiss()
            }
            else {
                debugPrint("Registration Successful!")
                debugPrint(authResult!)
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
    }
}
