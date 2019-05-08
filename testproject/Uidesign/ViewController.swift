//
//  ViewController.swift
//  Uidesign
//
//  Created by Ashok Gudipati on 04/05/19.
//  Copyright © 2019 Ashok Gudipati. All rights reserved.
//

import UIKit

class shareddata  {
    static let shareddat = shareddata()
    
}
struct DATA:Codable
{
    
    var status : Bool?
    var  message : String?
    var response:response?
    
   
}

struct response:Codable
{
    var alarmsInfo:[alarmsInfo]?
    var remindersInfo:[remindersInfo]?
    
}
struct alarmsInfo:Codable
{
   
    var time : String?
  
}
struct remindersInfo:Codable
{
    
}




class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // http://35.165.108.250:8080/CloudPeppers-V2_QA/saveAlarm
        // Do any additional setup after loading the view, typically from a nib.
        
        var para  = [String:Any]()
        para["time"] = "6:11 am"
        para["days"] = "0,1"
        para["repeatOrNot"] = "true"
        para["description"] = "test"
        para["title"] = "testalarm"
        para["memberId"] = "102"
         para["userId"] = "102"
        
        
        
        HttpWrapper.post(with: "http://35.165.108.250:8080/CloudPeppers-V2/saveAlarm", parameters: para, headers: nil, completionHandler: {(response) in
            
            
             print(response)
            
            
        }){ (error) in
            
            print(error)
            
        }
    }


}

