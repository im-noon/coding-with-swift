//
//  LogInViewController.swift
//  Flash Chat
//
//  Created by Slimn Srarena on 17/9/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class LogInViewController: UIViewController {

    //Textfields pre-linked with IBOutlets
    @IBOutlet var textfieldEmail: UITextField!
    @IBOutlet var textfieldPassword: UITextField!
    @IBOutlet weak var labelErrorMessage: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func logginButtonPressed(_ sender: UIButton) {
        SVProgressHUD.show()
        Auth.auth().signIn(withEmail: textfieldEmail.text!, password: textfieldPassword.text!) {
            (user, error) in
            if (error != nil) {
                debugPrint(error!)
                SVProgressHUD.dismiss()
            }
            else {
                SVProgressHUD.dismiss()
                debugPrint("Log In Successfull")
                self.performSegue(withIdentifier: "goToChat", sender: self)
            }
        }
    }

}
