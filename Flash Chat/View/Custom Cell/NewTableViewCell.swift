 //
//  NewTableViewCell.swift
//  Flash Chat
//
//  Created by Asem Qaffaf on 10/12/18.
//  Copyright © 2018 Asem Qaffaf. All rights reserved.
//

import UIKit

class NewTableViewCell: UITableViewCell {

    @IBOutlet var messageBody: UILabel!
    
    var sender: String = ""
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
