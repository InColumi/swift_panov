//
//  ReorderViewController.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 22/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

class ReorderViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //UIOutlets
    @IBOutlet weak var orderSummary: UITableView!
    @IBOutlet weak var tableNumber: UILabel!
    @IBOutlet weak var staffID: UILabel!
    @IBOutlet weak var totalAmount: UILabel!
    @IBOutlet weak var navBar: UINavigationBar!
    
    
    // Create a variable that holds a reference to AllOrdersTableView
    var previousVC = AllOrdersTableViewController()
    
    // Create a variable to hold the Order object passed from AllOrdersTableView
    var selectedOrder : Order!

    // Create a variable that holds the indexPath of a selected cell to be passed on to a segue
    var indexPathSelected : Int = 0
    
    // Create a variable to hold the orderTotal
    var amountDue : Double = 0.00
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         // Set orderNumber
        navBar.topItem?.title = "Order Number: " + selectedOrder.orderNumber
        // Set up waitStaffID
        staffID!.text = "Staff Number: " + String(selectedOrder.staffNumber)
        // Compute total cost of ordered dishes
        amountDue = computeTotal(dishes: selectedOrder.orderedDishes)
        // Display total cost
        totalAmount!.text = "$ " + String(format: "%.2f", amountDue)
        
        // Do any additional setup after loading the view.
        print(selectedOrder.orderNumber)
    }
    
    // A function that computes total cost of ordered dishes
    func computeTotal(dishes: [Dish]) -> Double {
        var total : Double = 0.00
        
        for dish in dishes {
            total += (Double(dish.qty) * dish.price)
        }
        return total
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return selectedOrder.orderedDishes.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = orderSummary.dequeueReusableCell(withIdentifier: "reorderCell", for: indexPath) as! ReorderTableViewCell
        
        let item = selectedOrder.orderedDishes[indexPath.row]
        
        cell.setOrder(dish: item)
        
        cell.qtyStepper.tag = indexPath.row
        cell.qtyStepper.addTarget(self, action: #selector(stepperChange), for: .valueChanged)
        
        return cell
    }
    
    @objc func stepperChange(sender: UIStepper) {
        let currentValue = sender.value
        let row = sender.tag
        
        selectedOrder.orderedDishes[row].qty = Int(currentValue)
        print(selectedOrder.orderedDishes[row].qty)
        
        //Reload orderSummary table view
        orderSummary.reloadData()
        
        // Recompute total cost of ordered dishes
        amountDue = computeTotal(dishes: selectedOrder.orderedDishes)
        
        // Display new total cost
        totalAmount!.text = "$ " + String(format: "%.2f", amountDue)
    }
    
    @IBAction func updateBtn(_ sender: Any) {
       // Update properties of selectedOrder in the AllOrderViewController
        self.previousVC.ordersArray[self.indexPathSelected].orderedDishes = selectedOrder.orderedDishes
        
            self.previousVC.ordersArray[self.indexPathSelected].orderTotal = amountDue
        //Reload Menu table view
        self.previousVC.allOrders.reloadData()
        // Collapse EditOrderView and transfer to previously accessed view controller on click
        self.navigationController?.popViewController(animated: true)
    }

}
