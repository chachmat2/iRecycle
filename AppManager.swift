//
//  AppManager.swift
//  iRecycle
//
//  Created by daniel moriya on 18/07/2016.
//  Copyright © 2016 daniel moriya. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
private var shared : AppManager? = nil
class AppManager: NSObject {
   
    let ref = FIRDatabase.database().reference()
    class func sharedInstance() -> AppManager {
        if shared == nil{
            shared = AppManager()
            shared?.initialize()
        }
        return shared!
    }
    
    
    func initialize(){
    
      
        
//    FIRDatabase.database().persistenceEnabled = true
   
    }
   
    func ConfigureDataBase( name: AnyObject, phone: AnyObject, city: AnyObject , credit: AnyObject){
      //credit as properties need to add : credit number : number , credit approval : boolean, amunt payment : Int, 
      // conect detail of user to the credit details.
    }
    func MinimumDetail(name: NSObject, city: NSObject){
//        when the credit is on and the user isn't payed.
//        add referrence to the labels)
    }
    
    func Authentication(){
        
    }
    func configureDatabase(numberUsers: [Int]) -> (Int) {
        var sum = 0
        
        for number in numberUsers {
            
            sum += number
        }
        return (sum)
    }
    func Signed( NameRegsiture : Bool) -> Bool{
        return false
    }
}

