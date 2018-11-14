//
//  LoginViewController.swift
//  Flash Chat
//
//  Created by Asem Qaffaf on 9/30/18.
//  Copyright © 2018 Asem Qaffaf. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class LoginViewController: UIViewController {

    
    
    
    @IBAction func enterPressed(_ sender: UIButton) {
        if passwordTextField.text != ""{
            loginPressed(sender
            )
        }
    }
    
    @IBOutlet var emailtextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    

    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
        SVProgressHUD.show()
        Auth.auth().signIn(withEmail: emailtextField.text!, password: passwordTextField.text!) {
            (user, Error) in
            if Error != nil{
                print("sign in another time")
                SVProgressHUD.showError(withStatus: Error?.localizedDescription)
            }
            else{
                print("you've logged in successful")
                self.performSegue(withIdentifier: "goToChat", sender: self)
            
                SVProgressHUD.dismiss()
            }
            
        }
    }


}
