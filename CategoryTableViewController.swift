//
//  CategoryTableViewController.swift
//  iRecycle
//
//  Created by daniel moriya on 17/05/2016.
//  Copyright © 2016 daniel moriya. All rights reserved.
//

import UIKit
import Firebase
class CategoryTableViewController: UITableViewController {
    let ref = FIRDatabase.database().reference()
    let myApplicationDelegate : AppDelegate?
    required init?(coder aDecoder: NSCoder) {
        self.myApplicationDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        super.init(coder: aDecoder)
    }
    var array : Array <String> = []
    private var tableArray : [String] = ["תיקון מחשבים ","נקיון","סבלות","תקונים","קניות"]
    private let kSourceCategorySegueIdentifier = "sourceCategorySegue"
     override func viewDidLoad() {
        super.viewDidLoad()
        addCategory()
//        saveBarbutton.enabled = false
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    func addCategory(){
        
        ref.child("pickcategores").observeEventType(FIRDataEventType.Value , withBlock: { (snapshot) -> Void in
//            self.tableArray += []
            //             self.FirebaseArray.append(snapshot)
            let value = snapshot.value as! NSDictionary
            let categoryval = value.allValues as! [NSDictionary]
            for values in categoryval{
                let cat = values.objectForKey("category") as! String
                self.array.append(cat)
              self.tableArray += self.array
            }
            self.tableView.reloadData()
        })
    }

    
    @IBAction func saveAction(sender: AnyObject) {
        let compArray = self.tableView.indexPathsForSelectedRows
        let payVC = self.storyboard?.instantiateViewControllerWithIdentifier("addCategoryBoard") as! AddCategoryController
        for index in compArray!{
        let item = tableArray[index.row]
        myApplicationDelegate?.infoCategory = item
            payVC.CTVC = self
            payVC.categorys = item
            
            self.navigationController?.pushViewController(payVC, animated: true)
        }
        
    }
    
    @IBOutlet weak var saveBarbutton: UIBarButtonItem!
    var selectedIndexPath : NSIndexPath?{
        didSet{
            saveBarbutton.enabled = (selectedIndexPath != nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableArray.count
    }
    

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let identifier = "cell"
        let cell = tableView.dequeueReusableCellWithIdentifier(identifier, forIndexPath: indexPath) as UITableViewCell

        // Configure the cell...
        cell.textLabel?.text = tableArray[indexPath.row]

        return cell
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
        // Get the new view controller using segue.destinationViewController.
        if segue.identifier == kSourceCategorySegueIdentifier {
            
        }
        // Pass the selected object to the new view controller.
    }
    

}
