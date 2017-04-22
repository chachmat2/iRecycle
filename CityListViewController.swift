//
//  CityListViewController.swift
//  iRecycle
//
//  Created by daniel moriya on 15/05/2016.
//  Copyright © 2016 daniel moriya. All rights reserved.
//

import UIKit

enum StateExample: Int{
    static let count = 2
    
    case Name,ZipCodes
}

class CityListViewController: UIViewController , UIPickerViewDataSource, UIPickerViewDelegate{
    
    
     override func viewDidLoad() {
        super.viewDidLoad()
     }
     @IBOutlet weak var cityLable: UILabel!
    
    @IBOutlet weak var cityPicker: UIPickerView!
    let myApplicationDelegate : AppDelegate?
    let dataDictionary : Dictionary<String,[String]>
    let allStates : [String]
    var selectedState : String
    required init?(coder aDecoder: NSCoder) {
        let path = NSBundle.mainBundle().pathForResource("Property List", ofType: "plist")!
        let dictionary = NSDictionary(contentsOfFile: path)!
        self.myApplicationDelegate = UIApplication.sharedApplication().delegate as? AppDelegate
        self.dataDictionary = dictionary as! Dictionary<String,[String]>
        self.allStates = (dictionary.allKeys as! [String]).sort()
        self.selectedState = allStates[0]
        super.init(coder: aDecoder)
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return StateExample.count
    }
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch StateExample(rawValue: component)!{
        case .Name: return allStates.count
        case .ZipCodes: return dataDictionary[selectedState]!.count
        }
    }
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
//        switch StateExample(rawValue: component)!{
//        case .Name: return allStates[row]
//        case .ZipCodes: return dataDictionary[selectedState]![row]
        if component == StateExample.Name.rawValue{
            return allStates[row]
        }
        return dataDictionary[selectedState]![row]
        }
    
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
            var string = ""
        
        if component == StateExample.Name.rawValue || component == StateExample.ZipCodes.rawValue{
            self.selectedState = allStates[row]
            pickerView.reloadComponent(StateExample.ZipCodes.rawValue)
            let city = allStates[pickerView.selectedRowInComponent(0)]
            let street = dataDictionary[selectedState]![pickerView.selectedRowInComponent(1)]
            string =  city + " " + street
            
        }
       

//        compsCount = cityPicker.selectedRowInComponent(0)
//        let city = allStates[compsCount!]
//        let code = dataDictionary[selectedState]![row]
//            string += city + " " + code + " "
        cityLable.text = string

}
    @IBAction func citystreetAction(sender: AnyObject) {
         let nextVC = self.storyboard?.instantiateViewControllerWithIdentifier("pDV") as! SignViewController
            nextVC.become = self
            myApplicationDelegate?.string = cityLable.text
//            nextVC.str = "name"
 //        let nextVC = storyboard?.instantiateViewControllerWithIdentifier("TextConnection") as! ConnectionDetailController
//        nextVC.infoCity = self.cityLable.text!
        
    }

 }