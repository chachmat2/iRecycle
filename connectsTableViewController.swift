//
//  connectsTableViewController.swift
//  iRecycle
//
//  Created by daniel moriya on 5/4/16.
//  Copyright © 2016 daniel moriya. All rights reserved.
//

// code from cell become true

import UIKit
import Firebase
class connectsTableViewController: UITableViewController{
     var typeList : Array <FIRDataSnapshot> = []
    var retrivecityArray : Array <String> = []
 
    let ref = FIRDatabase.database().reference()
    var openSectionsArray : [Bool] = [Bool] (count: 30, repeatedValue: true)
    
    func sectionCitytitle(){
         ref.child("employers").observeEventType(FIRDataEventType.Value, withBlock: {(snapshot) -> Void in
        self.retrivecityArray = []
        let value = snapshot.value as! NSDictionary
        let category = value.allValues as! [NSDictionary]
        for values in category{
         let cat = (values.objectForKey("city") as! String)
            self.retrivecityArray.append(cat)
 //         for (var i = 0; i < self.retrivecityArray.count ; i++){
//             if self.retrivecityArray[i] != self.retrivecityArray[i - 1] && self.retrivecityArray.count >= 1{
//                print("true")
//             } else {
//                print("false")
//             }
//            }
        }
        self.tableView.reloadData()
        })
    }

    func configure(){
        ref.child("employers").observeEventType(FIRDataEventType.Value, withBlock: {
            (snapshot) in
 //        (FIRDataEventType.ChildAdded, withBlock: { (snapshot) -> Void in
    
        for snap in snapshot.children{
            
            
     self.typeList.append(snap as! FIRDataSnapshot)
            print(snapshot.children)
    dispatch_async(dispatch_get_main_queue(), { () -> Void in
    self.tableView.insertRowsAtIndexPaths([NSIndexPath(forRow: self.typeList.count-1, inSection: 0)], withRowAnimation: UITableViewRowAnimation.Automatic)
 
                })
            }
        })
 
        
    }
    @IBAction func go2userDetail(sender: AnyObject) {
//        let nextVC = self.storyboard?.instantiateViewControllerWithIdentifier("TextConnection") as! ConnectionDetailController
//        nextVC.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sectionCitytitle()
         configure()
          self.navigationController?.navigationBarHidden = false
        self.tableView.reloadData()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
              return retrivecityArray.count
//        return openSectionsArray.count
       
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        if openSectionsArray[section] {
//            return section + 1
//        } else {
//            return 0
//        }
        return typeList.count
        
        
    }


    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let myIdentifier = clientTableCell.reuseIdentifier()
        let newcell = tableView.dequeueReusableCellWithIdentifier(myIdentifier, forIndexPath: indexPath) as! clientTableCell
        if typeList.count > 0 {
        var mytype = Type()
//        mytype
        let c = typeList[indexPath.row].value as! [String:AnyObject]
            
        newcell.clientName.text = c["name"] as? String
        newcell.clientCity.text = c["city"] as? String
        newcell.clientPhone.text = c["phoneNumber"] as? String
        newcell.clientCategory.text = c["Category"] as? String

        }
//        if DataSourceArray.count > 0 {
//            let indexRow = DataSourceArray[indexPath.row]
//            
//           newcell.clientName.text = indexRow["name"]
////            let town = count["city"] as? String
//            newcell.clientCity.text = indexRow["city"]
//
////            let name = count["name"] as? String
//            newcell.clientPhone.text =  indexRow["phoneNumber"]
//
////            let phone = count["phone"] as? String
//            newcell.clientCategory.text =  indexRow["Category"]
// //            let contact = count["credit"] as? String
//            
////         AppManager.sharedInstance().ConfigureDataBase(mytype.myname!, phone: mytype.phone!, city: mytype.city!, credit: mytype.contact!)
        
        // next project is to add a boolean value that hide phone and name of employers which determine by credit payment
        return newcell
        
        
        
//        let identifier = "requestCell"
//        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath)
//        let text = "row \(indexPath.row)"
//        cell.textLabel?.text = text
       
//        return cell
    }
  /*
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
//        return "section \(section)"
    }
   */
    override func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
         let label = UILabel(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size
            .width, height: tableView.sectionHeaderHeight))
         let c = retrivecityArray[section]
        label.text = "\(c)"
 //        label.text = "section \(section)"
        label.backgroundColor = UIColor.redColor()
        label.textColor = UIColor.blackColor()
        label.font = UIFont.boldSystemFontOfSize(20)
        
        return label
    }/*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        
        //pass info  after fhe flow is working/
       if segue.identifier == "TextConnection"{
//         let emailAndPhone = self.storyboard?.instantiateViewControllerWithIdentifier("TextConnection") as! ConnectionDetailController
//        self.navigationController?.pushViewController(emailAndPhone, animated: true)
        // Pass the selected object to the new view controller.
    }
    
    }
}
