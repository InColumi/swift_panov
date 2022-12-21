//
//  AllOrdersTableViewController.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 22/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

class AllOrdersTableViewController: UITableViewController {
    
    @IBOutlet var allOrders: UITableView!
    
    // Create a variable that holds a reference to OrderSummaryView
    var previousVC = OrderSummaryViewController()
    
    // Create a variable to hold the Order object passed from OrderSummaryView
    var newOrder : Order!
    
    // Create a variable to hold an array of Order objects
    var ordersArray : [Order] = []
    
    // Create a variable that holds the indexPath of a selected cell to be passed on to a segue
    var indexPathSelected : Int = 0
    
    // Instantiate orders
    let order1 = Order(oNum: "200", tNum: 12, sNum: 1002, oTotal: 16.00, oDishes: [Dish(image: UIImage(named: "xiao-long-bao")!, name: "Xiao long bao", category: "Entrée", qty: 2, price: 8.00, isSelected: true, info:"")])
    
    let order2 = Order(oNum: "201", tNum: 8, sNum: 1003, oTotal: 28.00, oDishes: [Dish(image: UIImage(named: "xiao-long-bao")!, name: "Xiao long bao", category: "Entrée", qty: 2, price: 8.00, isSelected: true, info: ""), Dish(image: UIImage(named: "xiao-long-bao")!, name: "Xiao long bao", category: "Main", qty: 1, price: 12.00, isSelected: true, info: "")])
    
    let order3 = Order(oNum: "202", tNum: 4, sNum: 1004, oTotal: 14.00, oDishes: [Dish(image: UIImage(named: "xiao-long-bao")!, name: "Xiao long bao", category: "Main", qty: 1, price: 14.00, isSelected: true, info: "")])
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ordersArray.append(order1)
        ordersArray.append(order2)
        ordersArray.append(order3)
        
        if newOrder != nil {
            ordersArray.append(newOrder)
        }
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return ordersArray.count
    }
    
    // Populate each table view cell with an order object
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let orderInfo : Order = ordersArray [indexPath.row]
        
        // Populate a cell with the values of the current order object
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderListCell", for: indexPath) as! ViewAllOrdersTableViewCell
        
        // Call the setOrder function of the ViewAllOrdersTableViewCell class
        // and pass current Order object to populate cell properties
        cell.setOrder(order: orderInfo)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt
        indexPath: IndexPath) {
        
        // Get the row number for selected order on the TableView
        let indexPath = tableView.indexPathForSelectedRow!
        
        indexPathSelected = indexPath.row
        
        //  Get the order object
        let selectedOrder = ordersArray[indexPath.row]
        
        // Perform segue pass to selected order to reorder screen
        performSegue(withIdentifier: "reorderSegue", sender: selectedOrder)
        
    }
    // Prepares segue to ReorderViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Override to prepare segue and pass reference of this ViewController to EditOrderViewController
        if let reorderVC = segue.destination as? ReorderViewController {
            if let order = sender as? Order {
                reorderVC.selectedOrder = order
                reorderVC.previousVC = self
                reorderVC.indexPathSelected = indexPathSelected
            }
        }
    }
}
