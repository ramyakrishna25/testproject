//
//  TableviewViewController.swift
//  Uidesign
//
//  Created by Ashok Gudipati on 04/05/19.
//  Copyright © 2019 Ashok Gudipati. All rights reserved.
//

import UIKit

class TableviewViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

   
    var starters = ["dfdgdg","dfgdfg"]
    var dishes = ["dfdgdg","dfgdfg"]
    var deserts = ["dfdgdg","dfgdfg"]
    var carsArray = ["dfdgdg","dfgdfg"]
    var Dt:DATA?
    
    @IBOutlet weak var tableviewF: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
//http://35.165.108.250:8080/CloudPeppers-V2/getMemberDetailsByMemberId?memberId=102
        // Do any additional setup after loading the view.
        
         HttpWrapper.gets(with: "http://35.165.108.250:8080/CloudPeppers-V2/getMemberDetailsByMemberId?memberId=102", parameters: nil, headers: nil, completionHandler: { (response, error)  in
            
            guard let data = response else { return }
            do {
                self.carsArray.removeAll()
                let loginRespone = try JSONDecoder().decode(DATA.self, from: data)
                self.Dt = loginRespone
                
                if (self.Dt?.response?.alarmsInfo?.count)! > 0
                {
                    self.carsArray.append("Alarm")
                }
                if (self.Dt?.response?.alarmsInfo?.count)! > 0
                {
                    self.carsArray.append("Remender")
                }
                
                
                print(loginRespone)
                self.tableviewF.reloadData()
                
            }
                catch let jsonErr {
                   
                    print("Error serializing json:", jsonErr)
                    
                  
                }
                
                
            }){ (error) in
               
                
            }
            
    }
    
   func numberOfSections(in tableView: UITableView) -> Int {
    
  
       return 2
    
    }
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
//            if Dt?.response?.alarmsInfo?.count ?? 0 > 0
//            {
//                return (Dt?.response?.alarmsInfo?.count)!
//            }
        
            return 0
        }
        else if section == 1 {
            return 2
        }
        else {
            return deserts.count
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
//        if section == 0 {
//            return "Starters"
//        }
//        else if section == 1 {
//            return "Dishes"
//        }
//        else {
            return carsArray[section]
     //   }
    }
    
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
            
            cell.textLabel?.text = "sdfsdf"
            
            
            
            return cell
        }
        else if indexPath.section == 1 {
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath)
            
            cell.textLabel?.text = "remenders"
            return cell
                
                //tableView.dequeueReusableCell(withIdentifier: "DishesCell", for: indexPath)
        }
        else {
            return UITableViewCell()
                
              //  tableView.dequeueReusableCell(withIdentifier: "DesertsCell", for: indexPath)
        }
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         if section == 0
         {
             return  0
        }
        if section == 1
        {
            return  12
        }
        
       return  0
       
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
