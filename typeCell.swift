//
//  typeCell.swift
//  iRecycle
//
//  Created by daniel moriya on 30/12/2016.
//  Copyright © 2016 daniel moriya. All rights reserved.
//

import UIKit
import Firebase
class typeCell: UITableViewCell {
    @IBOutlet weak var postLabel: UILabel!
   class func reuseIdentifier() -> String{
        return "cell"
    }
    func configureData(Data: NSObject){
        postLabel.text = Data as? String 
    }
}
