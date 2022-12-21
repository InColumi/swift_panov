//
//  ViewController.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 18/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

//ViewController that handles the homepage
class ViewController: UIViewController {
    
    var user : String = ""

    @IBOutlet weak var userSelector: UISegmentedControl!
    
    @IBAction func signInBtn(_ sender: Any) {
        
        
        if self.userSelector.selectedSegmentIndex == 0 {
            
            // if the Wait Staff segment is selected,
            user = "Wait Staff"
            // implement segue to Wait Staff ID picker view
            performSegue(withIdentifier: "waitStaffSegue", sender: nil)
        } else {
            // if the Admin segment is selected,
            user = "Admin"
            // implement segue to Admin table view
            performSegue(withIdentifier: "adminSegue", sender: nil)
        }
        
        print(user)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

