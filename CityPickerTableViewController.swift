//
//  CityPickerTableViewController.swift
//  iRecycle
//
//  Created by daniel moriya on 05/07/2016.
//  Copyright © 2016 daniel moriya. All rights reserved.
//

import UIKit
import Firebase

class CityPickerTableViewController: UITableViewController{

      let ref = FIRDatabase.database().reference()
    let dataDictionary : Dictionary<String,[String]>
     var selectedState : [String]
 
    let myApplicationDelegate : AppDelegate?
    var UserText : String?
    
     required init?(coder aDecoder: NSCoder) {
        let path = NSBundle.mainBundle().pathForResource("Property List", ofType: "plist")!
        let dictionary = NSDictionary(contentsOfFile: path)!
        self.dataDictionary = dictionary as! Dictionary<String,[String]>
        self.selectedState = (dictionary.allKeys as! [String]).sort()
        self.myApplicationDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        super.init(coder: aDecoder)
    }
        override func viewDidLoad() {
        saveBarbutton.enabled = false
            
           
        }

    @IBAction func saveAction(sender: AnyObject) {
        let compArray = self.tableView.indexPathsForSelectedRows
        let nameVC = self.storyboard?.instantiateViewControllerWithIdentifier("addCategoryBoard") as! AddCategoryController
        for index in compArray!{

            let item = selectedState[index.row]
//            if (compArray?.last) != index{
                myApplicationDelegate?.infosereverCity = item
                nameVC.str = self
                nameVC.ACategoryC = item
//            }
            self.navigationController?.pushViewController(nameVC, animated: true)
        }

        
        
    }

    @IBOutlet weak var saveBarbutton: UIBarButtonItem!
   
    var selectedIndexPath : NSIndexPath?{
        didSet{
            saveBarbutton.enabled = (selectedIndexPath != nil)
          selectedIndexPath = self.tableView.indexPathForSelectedRow  
        }
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return selectedState.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as UITableViewCell

        let city = selectedState[indexPath.row]
        cell.textLabel?.text = city
        

        return cell
    }
   
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let cell = tableView.cellForRowAtIndexPath(indexPath)!
        cell.setSelected(false, animated: true)
        
        if selectedIndexPath != nil{
            tableView.cellForRowAtIndexPath(selectedIndexPath!)?.accessoryType = .None
            if indexPath.isEqual(selectedIndexPath){
                self.selectedIndexPath = nil
                return
            }
        }
        cell.accessoryType = .Checkmark
        self.selectedIndexPath = indexPath
    }
    /*
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
        if segue.identifier == "sourceCitySegue"{
            

//        let nextVC = segue.destinationViewController as! AddCategoryController
//            nextVC.Addbecome = self
             }
//         Get the new view controller using
         // Pass the selected object to the new view controller.
        }
    
}
