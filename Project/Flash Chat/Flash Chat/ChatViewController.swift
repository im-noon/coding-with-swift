//
//  ChatViewController.swift
//  Flash Chat
//
//  Created by Slimn Srarena on 17/9/19.
//  Copyright © 2019 Noon Studio. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD
import ChameleonFramework

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    var messageArray : [Message] = [Message]()

    // We've pre-linked the IBOutlets
    @IBOutlet var constraintHeight: NSLayoutConstraint!
    @IBOutlet var buttonSendMessage: UIButton!
    @IBOutlet var textfieldMessage: UITextField!
    @IBOutlet var tableViewMessage: UITableView!
    @IBOutlet weak var composeMessageView: UIView!
    


    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Set tableView delegate and datasource:
        tableViewMessage.delegate = self
        tableViewMessage.dataSource = self
        
        // Set delegate of the text field:
        
        textfieldMessage.delegate = self


        // Set the tapGesture:
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        tableViewMessage.addGestureRecognizer(tapGesture)


        // Register message cell  file:
        tableViewMessage.register(UINib(nibName: "senderMessageCell", bundle: nil),
                                  forCellReuseIdentifier: "senderMessageCell")
        
        tableViewMessage.register(UINib(nibName: "receiverMessageCell", bundle: nil),
                                  forCellReuseIdentifier: "receiverMessageCell")

        configureTableView()
        retrieveMessage()
    }

    @IBAction func logoutButtonPressed(_ sender: UIBarButtonItem) {
        
        // Log out the user and send them back to WelcomeViewController
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        }
        catch {
            debugPrint(error)
        }
    }
    
    @IBAction func sendButtonPressed(_ sender: UIButton) {
        
        textfieldMessage.endEditing(true)
        
        // Send the message to Firebase and save it in our database
        
        textfieldMessage.isEnabled = false
        buttonSendMessage.isEnabled = false
        
        let messageDB = Database.database().reference().child("Message")
        
        let messageDict = ["Sender": Auth.auth().currentUser?.email, "MessageBody": textfieldMessage.text!]
        
        messageDB.childByAutoId().setValue(messageDict) {
            (error, reference) in
            if error != nil {
                debugPrint(error!)
            }
            else {
                debugPrint("Message saved successfully")
                self.textfieldMessage.isEnabled = true
                self.buttonSendMessage.isEnabled = true
                self.textfieldMessage.text = ""
                self.retrieveMessage()
            }
        }
    }
    
    ///////////////////////////////////////////

    //MARK: - TableView DataSource Methods
    
    
    

    // Declare cellForRowAtIndexPath:
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let messageBody = messageArray[indexPath.row].message
        let senderName = messageArray[indexPath.row].sender
        if senderName == Auth.auth().currentUser?.email as String? {
            let senderCell = tableView.dequeueReusableCell(withIdentifier: "senderMessageCell",
                                                     for: indexPath) as! senderMessageCell
            
            senderCell.labelMessageBody.text = messageBody
            senderCell.imageAvatar.image = UIImage(named:"egg")
            senderCell.messageView.backgroundColor = UIColor.flatSkyBlue()
            senderCell.imageAvatar.backgroundColor = UIColor.flatMint()
            
            return senderCell
        }
        else {
            
            let receiverCell = tableView.dequeueReusableCell(withIdentifier: "receiverMessageCell",
                                                     for: indexPath) as! receiverMessageCell
            
            receiverCell.labelMessageBody.text = messageBody
            receiverCell.imageAvatar.image = UIImage(named:"egg")
            
            receiverCell.messageView.backgroundColor = UIColor.flatWatermelon()
            receiverCell.imageAvatar.backgroundColor = UIColor.flatLime()
            
            return receiverCell
        }

    }


    // Declare numberOfRowsInSection:
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        debugPrint("\(#function) \(#line): \(messageArray.count)")
        return messageArray.count
    }


    // Declare tableViewTapped:
    @objc func tableViewTapped() {
        print("tableViewTapped")
        textfieldMessage.endEditing(true)
    }

    // Declare configureTableView:
    func configureTableView() {
        print("configureTableView")
        tableViewMessage.rowHeight = UITableView.automaticDimension
        tableViewMessage.estimatedRowHeight = 120
    }


    ///////////////////////////////////////////

    //MARK:- TextField Delegate Methods




    // Declare textFieldDidBeginEditing:
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("textFieldDidBeginEditing")
        UIView.animate(withDuration: 0.5) {
            self.constraintHeight.constant = 360
            self.view.layoutIfNeeded()
        }
    }



    // Declare textFieldDidEndEditing:
    func textFieldDidEndEditing(_ textField: UITextField) {
        print("textFieldDidEndEditing")
        UIView.animate(withDuration: 0.5) {
            self.constraintHeight.constant = 50
            self.view.layoutIfNeeded()
        }
    }


    ///////////////////////////////////////////


    //MARK: - Send & Recieve from Firebase
    func retrieveMessage() {
        
        messageArray.removeAll()
        let messageDB = Database.database().reference().child("Message")
        
        messageDB.observe(.childAdded) {
            (snapshot) in
            let getMessage = snapshot.value as! Dictionary<String, String>
            debugPrint("\(#function) \(#line): \(getMessage)")
            let text : String = getMessage["MessageBody"]!
            let sender : String = getMessage["Sender"]!
            
            let messageData = Message(sender, text)
            self.messageArray.append(messageData)
            debugPrint("\(#function) \(#line): \(self.messageArray)")
            self.tableViewMessage.reloadData()
            debugPrint(sender, text)
        }
    }
}
