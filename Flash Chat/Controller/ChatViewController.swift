//
//  ChatViewController.swift
//  Flash Chat
//
//  Created by Asem Qaffaf on 9/30/18.
//  Copyright © 2018 Asem Qaffaf. All rights reserved.
//

import UIKit
import Firebase
import ChameleonFramework
import SVProgressHUD
//import LiferayScreens
class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate   {
    
    var messageArray: [Message] = [Message]()
    
    @IBOutlet var test22: NSLayoutConstraint!
    @IBOutlet var messageTextField: UITextField!
    @IBOutlet var messageTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: Set the Delegate and DataSource
        messageTableView.delegate = self
        messageTableView.dataSource = self
        
        //TODO: set the Deleagte of TextField
        messageTextField.delegate = self
    
        
        
        //TODO: Register the MessageCell.xib file here
         messageTableView.register(UINib(nibName: "NewTableViewCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")
        
        
        //TODO: register TapGesture
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        
        messageTableView.addGestureRecognizer(tapGesture)
        retriveMessage()
        
        messageTableView.separatorStyle = .none

        scrollToBottom()
    }
 
    
    
    @IBAction func logOutPressed(_ sender: UIBarButtonItem) {
        do{
        try Auth.auth().signOut()
            print("loged out")
           navigationController?.popToRootViewController(animated: true)
        }
        catch let error{
            print(error)
        }
    }

    
//    TODO: Declare cellForRowAtIndexPath
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell2 = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! NewTableViewCell
    cell2.messageBody.text = messageArray[indexPath.row].messageBody
        
        if messageArray[indexPath.row].sender == Auth.auth().currentUser?.email {
            cell2.messageBody.backgroundColor = UIColor.flatGray()
        }
        else{
            cell2.messageBody.backgroundColor = UIColor.flatRed()
        }
        
        return cell2
    }

    //TODO: Declare NumbersofRow
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    //TODO: Declare configureTableView here:
    func configureTableView() {
        messageTableView.rowHeight =  UITableView.automaticDimension
        messageTableView.estimatedRowHeight = 12.0
        
    }
    ///////////////////////
    //MARK: - Text field Delegate

    //TODO: textField did begin  Editing here:
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        UIView.animate(withDuration: 0.4) {
        
        

        if (UIDevice.current.orientation == UIDeviceOrientation.landscapeLeft) || (UIDevice.current.orientation == UIDeviceOrientation.landscapeRight) {
            self.test22.constant = 242
            self.view.layoutIfNeeded()

        }
        else{

         self.test22.constant = 315
        self.view.layoutIfNeeded()
        }
            
        }
    }
    // TODO: textField did end Editing
    func textFieldDidEndEditing(_ textField: UITextField) {
      
        UIView.animate(withDuration: 0.5)   {
            self.test22.constant = 50
            self.view.layoutIfNeeded()
            }
        
    }
    //TODO: Declare tableViewTapped here
    @objc func tableViewTapped(){
        messageTextField.endEditing(true)
    }
    
//TODO: Create the sendpressed method here:
    @IBAction func sendpressed1(_ sender: UIButton) {
        
        
//                messageTableView.endEditing(true)
//                messageTextField.isEnabled = false
//                sender.isEnabled = false
        
        if messageTextField.text != ""{
        let messageDB = Database.database().reference().child("message")
            let messageDictionary = ["send": Auth.auth().currentUser?.email, "message": self.messageTextField.text!]
        
        messageDB.childByAutoId().setValue(messageDictionary){
            (Error, reference) in
            if Error != nil{
                print(Error!)
                SVProgressHUD.showError(withStatus: Error?.localizedDescription)
            }
            else{
                print("Message saved Successfully ")
                
//                                self.messageTextField.isEnabled = true
//                                sender.isEnabled = true
                
                self.messageTextField.text = ""
                self.configureTableView()
                self.messageTableView.reloadData()
                
            
            }
        }
        }
        
    }
//TODO: Create the retriveMessage method here:
    func retriveMessage() {

        let messageDB = Database.database().reference().child("message")
   
        messageDB.observe(.childAdded) {
            (snapshot) in
            
            let snapshotValue = snapshot.value as! Dictionary<String,String>
            
            let text = snapshotValue["MessageBody"]!
            let sender = snapshotValue["send"]!

//            print(sender)
//            messageDB = Database.database().reference().child(sender)

//            print(text,sender)
            
            let messages = Message()
            messages.messageBody = text
            messages.sender = sender
            
            self.messageArray.append(messages)
            
            self.configureTableView()
            self.messageTableView.reloadData()
            
            self.scrollToBottom()
        }
        
    }

    
    func scrollToBottom()  {
        let y: CGFloat = self.messageTableView.contentSize.height
        self.messageTableView.setContentOffset(CGPoint(x: 0, y: y + 10), animated: true)
       
   
        self.messageTableView.setContentOffset(CGPoint(x: 0, y: self.messageTableView.contentSize.height - UIScreen.main.bounds.height), animated: true)


        
    }




}


