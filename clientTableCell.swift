//
//  clientTableCell.swift
//  iRecycle
//
//  Created by daniel moriya on 06/12/2016.
//  Copyright © 2016 daniel moriya. All rights reserved.
//

import UIKit

class clientTableCell: UITableViewCell {
    @IBOutlet weak var clientName: UILabel!
    @IBOutlet weak var clientCity: UILabel!
    @IBOutlet weak var clientPhone: UILabel!
    @IBOutlet weak var clientCategory: UILabel!

    class func reuseIdentifier() -> String {
        return "cell"
    }
     
    override func awakeFromNib() {
        super.awakeFromNib()
        AppManager.sharedInstance().ConfigureDataBase(clientName, phone: clientPhone, city: clientCity, credit: clientCategory)
        // Initialization code
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
