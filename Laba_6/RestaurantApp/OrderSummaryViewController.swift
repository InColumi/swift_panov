//
//  OrderSummaryViewController.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 22/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

class OrderSummaryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{

    // Create an array that contains the ordered Dish objects
    var orderedDishes : [Dish] = []
    
    // Reference to MenuTableView
    var previousVC = MenuTableViewController()
    
    // Accept selectedID from MenuTableView
    var selectedID : Int = 0
    
    // Create a variable to hold the orderNumber from OrderSummaryView
    var orderNum : String = "204"
    
    // Create a variable to hold the tableNumber from OrderSummaryView
    var tableNum : Int = 0
    
    // Create a variable to hold the orderTotal from OrderSummaryView
    var totalAmount : Double = 0.00
    
    // Create a variable that holds the indexPath of a selected cell to be passed on to a segue
    var indexPathSelected : Int = 0

    
    // UIOutlets
    @IBOutlet weak var orderNumber: UILabel!
    @IBOutlet weak var waitStaffID: UILabel!
    @IBOutlet weak var tableNumber: UITextField!
    @IBOutlet weak var totalCost: UILabel!
    @IBOutlet weak var orderSummary: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set orderNumber
        orderNumber.text = orderNum
        // Set up waitStaffID
        waitStaffID!.text = String(selectedID)

        // Compute total cost of ordered dishes
        totalAmount = computeTotal(dishes: orderedDishes)
        // Display total cost
        totalCost!.text = "$ " + String(format: "%.2f", totalAmount)
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
        return orderedDishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // Populate a cell with the values of the current dish object
        let cell = tableView.dequeueReusableCell(withIdentifier: "orderCell", for: indexPath) as! OrderTableViewCell
        
        //get current item
        let item = orderedDishes[indexPath.row]
        
        cell.dishName!.text = item.name
        cell.dishQty!.text = String(item.qty)
        
        //Calculate total price of ordered dish
        let orderCost = Double(item.qty) * item.price
        cell.orderPrice!.text = "$ " + String(format: "%.2f", orderCost)
        
        return cell
    }
    
    // Allows order cells to be editable
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Implement delete function when user swipes left on a order cell, to remove an item form order summary
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            let dishItem = orderedDishes[indexPath.row]
            
            // Remove dish currently selected from orderedDishes array
            orderedDishes.remove(at: indexPath.row)
            
            // Reload orderSummaryTableView
            orderSummary.reloadData()
            
            // When a dish is removed, find removed dish item in MenuTableView and switch dish item off or set qty to 0
            findInMenuTable(orderedDish: dishItem)
            
            // Reload menuTableView
            previousVC.menuTableView.reloadData()
            
            // Recompute total cost of ordered dishes
            totalAmount = computeTotal(dishes: orderedDishes)
            
            // Display new total cost
            totalCost.text = "$ " + String(format: "%.2f", totalAmount)
        }
    }
    
    // A function that finds the dish item in the menu table view that matches the removed dish item in orderSummary, and flips that dish item's switch off
    
    func findInMenuTable(orderedDish : Dish) {
        // Check the category of the selectedDish item
        if orderedDish.category == "Entrée" {
            // If entree dish, loop through entreeDishes array
            for entree in previousVC.entreeDishes {
                // Find matching dish name and flip switch off
                if entree.name == orderedDish.name {
                    entree.isSelected = false
                    entree.qty = 0
                }
            }
        } else if orderedDish.category == "Main" {
            // If main dish, loop through mainDishes array
            for main in previousVC.mainDishes {
                // Find matching dish name and flip switch off
                if main.name == orderedDish.name {
                    main.isSelected = false
                    main.qty = 0
                }
            }
            
        } else {
            // If dessert dish, loop through dessertDishes array
            for dessert in previousVC.dessertDishes {
                // Find matching dish name and flip switch off
                if dessert.name == orderedDish.name {
                    dessert.isSelected = false
                    dessert.qty = 0
                }
            }
        }
    }
    
    // On click of folder icon, open list of all orders by specific staff member
    @IBAction func orderHistory(_ sender: Any) {
        // Perfom segway to view all orders
        performSegue(withIdentifier: "viewAllOrders", sender: nil)
    }
    
    
    
    // On click of submit order button, send Alert box/ SMS
    @IBAction func submitBtn(_ sender: Any) {
        // Set up alert box
        // On submit, check if Table Number input field is not empty
        if tableNumber.text!.isEmpty == true {
            //  If empty, flag an alert to fill input field before submission
            let alertController = UIAlertController(title: "Error Order Submission", message: "\nCannot submit an order with missing Table Number input field.", preferredStyle : .alert)
            
            let alertAction = UIAlertAction (title: "Dismiss", style: .cancel, handler: nil)
            
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion: nil)
            
            tableNumber.attributedPlaceholder = NSAttributedString(string: "missing field", attributes: [NSAttributedString.Key.foregroundColor: UIColor.red])
        } else {
            // Else if not empty, alert successful submission
            
            orderNum = orderNumber.text!
            tableNum = Int(tableNumber.text!)!
            
            let alertController = UIAlertController(title: "Successful Order Submission", message: "\nYour Order Number \(orderNumber.text!)\nhas been sent to the kitchen.", preferredStyle: .alert)
            
            // Create Order Object
            
            let newOrder = Order(oNum: orderNum, tNum: tableNum, sNum: selectedID, oTotal: totalAmount, oDishes: orderedDishes)
            
            // When alert box is dismissed, revert to menu dish and empty the orderedDish array
            alertController.addAction(UIAlertAction (title: "Dismiss", style: .cancel, handler: {action in
                
                // Perform segue to AllOrdersTableView
                self.performSegue(withIdentifier: "viewAllOrders", sender: newOrder)
                
                // For each Dish in the menuTableView, set qty back to 0 and set switch off
                for eachDish in self.previousVC.entreeDishes {
                    eachDish.qty = 0
                    eachDish.isSelected = false
                }
                for eachDish in self.previousVC.mainDishes {
                    eachDish.qty = 0
                    eachDish.isSelected = false
                }
                for eachDish in self.previousVC.dessertDishes {
                    eachDish.qty = 0
                    eachDish.isSelected = false
                }
                
                // Reload menuTableView
                self.previousVC.menuTableView.reloadData()
                
                
                // Reset total amount to 0.00
                self.totalAmount = 0.00
                self.totalCost.text =  "$ " + String(format: "%.2f", self.totalAmount)
                // Increment order number
                self.orderNumber.text = String(Int(self.orderNum)! + 1)
                // Reset table number
                self.tableNumber.text = ""
                //Empty orderedDishes array
                self.orderedDishes = []
                
                // Reload orderSummary
                self.orderSummary.reloadData()
            }))
            present(alertController, animated: true, completion: nil)
            
        }
    }
    
    // Prepare segue to viewAllOrders screen
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Override to prepare segue and pass reference of this ViewController to EditOrderViewController
        if let viewAllOrdersVC = segue.destination as? AllOrdersTableViewController {
            if let order = sender as? Order {
                viewAllOrdersVC.newOrder = order
            }
        }
    }
}
