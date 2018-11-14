//
//  WelcomeViewController.swift
//  Flash Chat
//
//  Created by Asem Qaffaf on 9/30/18.
//  Copyright © 2018 Asem Qaffaf. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var statusLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        fitchTime()
    }
    func fitchTime()  {
        let dateFormatter : DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH"
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        
        let dateInt = Int(dateString)!
        if dateInt >= 00 && dateInt < 04{
             statusLabel.text = "Start a new Day"
        }
       else if dateInt >= 04 && dateInt < 11 {
            statusLabel.text = "Good morning"
        }
        else if dateInt >= 11 && dateInt < 16{
            statusLabel.text = "Good Afternoon"
        }
        else if dateInt >= 16 && dateInt < 19{
            statusLabel.text = "Good Evening"
        }
        else if dateInt >= 19 &&  dateInt < 24{
            statusLabel.text = "Good Night"
        }
        

    }
    
}
