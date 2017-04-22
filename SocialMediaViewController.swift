//
//  SocialMediaViewController.swift
//  iRecycle
//
//  Created by daniel moriya on 11/18/15.
//  Copyright (c) 2015 daniel moriya. All rights reserved.
//

import UIKit

class SocialMediaViewController: UIViewController {

    @IBAction func saveAction(sender: AnyObject) {
        let payVC = self.storyboard?.instantiateViewControllerWithIdentifier("paymentBoard")
        self.navigationController?.pushViewController(payVC!, animated: true)
    }
        override func viewDidLoad() {
        super.viewDidLoad()
            
            let fbLoginButton = FBSDKLoginButton()
            fbLoginButton.readPermissions = ["email"]
            
            //        fbLoginButton.frame.origin = CGPoint(x: 0, y: 20)
            fbLoginButton.center = self.view.center
            self.view.addSubview(fbLoginButton)

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
