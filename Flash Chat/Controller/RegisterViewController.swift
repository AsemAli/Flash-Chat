//
//  RegisterViewController.swift
//  Flash Chat
//
//  Created by Asem Qaffaf on 9/30/18.
//  Copyright © 2018 Asem Qaffaf. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class RegisterViewController: UIViewController {

    @IBAction func test111(_ sender: UIButton) {
        if passwordTextField.text != ""{
            registerPressed(sender)
  
        }
    }
    @IBOutlet var enterTriggerd: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
  

        // Do any additional setup after loading the view.
    }
    @IBAction func registerPressed(_ sender: UIButton) {
        SVProgressHUD.show()
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil{
                print(error!)
                    SVProgressHUD.showError(withStatus: error?.localizedDescription)
            }
            else{
                print("Registration Successful!")
              
                self.performSegue(withIdentifier: "goToChat", sender: self)
                SVProgressHUD.dismiss()
            }
        }
    }

    


}
