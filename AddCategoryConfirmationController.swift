//
//  AddCategoryConfirmationController.swift
//  iRecycle
//
//  Created by daniel moriya on 13/10/2016.
//  Copyright © 2016 daniel moriya. All rights reserved.
//

import UIKit
import Firebase

class AddCategoryConfirmationController: UIViewController {
    @IBOutlet weak var categorylabel: UILabel!

    @IBOutlet weak var dtailLable: UILabel!
        @IBOutlet weak var fName: UILabel!
  
    @IBOutlet weak var cityNameLabel: UILabel!
    @IBOutlet weak var categoryLabel: UILabel!
    
    let myApplicationDelegate : AppDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        self.myApplicationDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        super.init(coder: aDecoder)
    }

    @IBAction func addCategoryAction(sender: AnyObject) {
        let cityVC = self.storyboard?.instantiateViewControllerWithIdentifier("addCategoryBoard") as! CityPickerTableViewController
        self.navigationController?.pushViewController(cityVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
      fName.text = myApplicationDelegate?.infoName
      cityNameLabel.text = myApplicationDelegate?.infosereverCity
     categorylabel.text = myApplicationDelegate?.infoCategory
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
