//
//  ResetPasswordViewController.swift
//  Flash Chat
//
//  Created by Asem Qaffaf on 9/30/18.
//  Copyright © 2018 Asem Qaffaf. All rights reserved.
//

import UIKit
import Firebase

class ResetPasswordViewController: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    
    var num = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        // Do any additional setup after loading the view.
    }
    @IBAction func dismissPressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
       let str = emailTextField.text!
        if str == ""{
        num = 0
        }
        else if (str.range(of: "@") != nil && (str.range(of: ".")) != nil) {
            num += 1
        }
        if num == 1{
        Auth.auth().sendPasswordReset(withEmail: emailTextField.text!, completion: nil)
            self.dismiss(animated: true, completion: nil)
        }
        print(num)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


