//
//  SignViewController.swift
//  iRecycle
//
//  Created by daniel moriya on 11/18/15.
//  Copyright (c) 2015 daniel moriya. All rights reserved.
// first Firebase "code" as false

import UIKit
import CoreData
//import FirebaseAuth
import Firebase
class SignViewController: UIViewController {
    
    let ref = FIRDatabase.database().reference()
    let Authid = FIRAuth.auth()?.currentUser?.uid
     
    var become : CityListViewController?
    let myApplicationDelegate : AppDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        self.myApplicationDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        super.init(coder: aDecoder)
    }
    @IBOutlet weak var exmLabel: UILabel!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var EmailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
            exmLabel.text = become?.cityLable.text
         
//               FIRAuth.auth()?.signInAnonymouslyWithCompletion({ (user, error) -> Void in
        //        if let error = error {
        //            print("sign in failed:" , error.localizedDescription)
        //        } else {
        //            print("Signed in with uid: ", user?.uid)
        //        }
        //       })
        // Do any additional setup after loading the view.
    }

    enum SegueType : Int{
        case payment = 0
        case name = 1
    }
    @IBAction func SendNameToTableList(sender: AnyObject) {
        
        let email = EmailTextField.text
        let pass = passwordTextField.text
//         let context: NSManagedObjectContext = myApplicationDelegate!.managedObjectContext
//        let newUser = NSEntityDescription.insertNewObjectForEntityForName("Sign", inManagedObjectContext: context)
//        newUser.setValue(email, forKey: "email")
//        newUser.setValue(pass, forKey: "password")
//        do{
//            try context.save()
//            print(newUser)
//            print("Object saved")
//        } catch {
//            
//        }
        
        if email != "" && pass != ""{
            myApplicationDelegate?.infoEmail = EmailTextField.text
            let nameVC = self.storyboard?.instantiateViewControllerWithIdentifier("paymentBoard")
            self.navigationController?.pushViewController(nameVC!, animated: true)

        } else{
            let AlertController = UIAlertController(title: "נכשל ", message: "השלם", preferredStyle: .Alert)
            let deliteAlertAction = UIAlertAction(title: "חזור", style: .Default, handler: nil)
            AlertController.addAction(deliteAlertAction)
            
            self.presentViewController(AlertController, animated: true, completion: nil)
//            let payVC = self.storyboard?.instantiateViewControllerWithIdentifier("")
//            self.navigationController?.pushViewController(payVC!, animated: true)
            
        }
        //        }
    }
   
    @IBAction func SendLoginAction(sender: AnyObject) {
//        self.performSegueWithIdentifier("pushFbLogin", sender: sender)
        
      //I am only made a storyboard segue and it is working. socialSB
    }
   
   
    
    @IBAction func SignedUp(sender: AnyObject) {
        let context: NSManagedObjectContext = myApplicationDelegate!.managedObjectContext
        
        let request = NSFetchRequest(entityName: "Sign")
        request.returnsObjectsAsFaults = false
        request.predicate = NSPredicate(format: "email = %@", EmailTextField.text!)
        
        do{
            let results : NSArray = try context.executeFetchRequest(request)
            if results.count > 0{
                //                for res in results{
                //                    print(res)
                //                }
                let res = results[0] as! NSManagedObject
                EmailTextField.text = res.valueForKey("email") as? String
                passwordTextField.text = res.valueForKey("password") as? String
                
            } else{
                print("0 Results Returned.. Potential Error")
            }
        }catch
            let error as NSError{
                print(error)
        }
        let payVC = self.storyboard?.instantiateViewControllerWithIdentifier("paymentBoard")
        self.navigationController?.pushViewController(payVC!, animated: true)
    }
    
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
               // Pass the selected object to the new view controller.
//        let nextVC = segue.destinationViewController as! AddCategoryController
        myApplicationDelegate!.infoEmail = self.EmailTextField.text
        
    }
    

}
