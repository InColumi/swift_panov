//
//  EditOrderViewController.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 21/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

class EditOrderViewController: UIViewController {
    
    // Create a variable that holds a reference to MenuTableView
    var menuTableVC = MenuTableViewController()
    
    // Create a variable to hold the Dish object from the selected OrderSummaryTableView cell
    var selectedDish = Dish(image: UIImage(named: "default-dish")!, name: "", category: "", qty: 0, price: 0.00, isSelected: false, info: "")
    
    // Create variable to accept index of selectedRow from OrderSummary
    var selectedRowInt : Int = 0
    
    // UIOutlets
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var selectedDishImage: UIImageView!
    @IBOutlet weak var selectedDishCategory: UILabel!
    @IBOutlet weak var selectedDishPrice: UILabel!
    @IBOutlet weak var selectedDishQty: UITextField!
    @IBOutlet weak var editQtyStepper: UIStepper!
    @IBOutlet weak var selectedDishInfo: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set navigation bar title to the selectedDish name propert
        navBar.topItem?.title = selectedDish.name
        // Set the value of UIOutlets
        selectedDishImage.image = selectedDish.image
        selectedDishCategory.text = selectedDish.category + " Dish"
        selectedDishPrice.text = "$ " + String(format: "%.2f", selectedDish.price)
        selectedDishInfo.text = selectedDish.info
        selectedDishQty.text = String(selectedDish.qty)
        // Set the value of the stepper to equal selectedDish qty
        editQtyStepper.value = Double(selectedDish.qty)
    }
    
    @IBAction func stepperAction(_ sender: UIStepper) {
        selectedDishQty.text = String(format: "%.0f", sender.value)
    }
    

    @IBAction func editBtn(_ sender: Any) {
        
        // When editBtn is clicked, update the qty property of the selectedDish item
        if Int(editQtyStepper.value) >= 1 {
            
            // if selectedMenuDish qty is not 0, proceed with updating qty value in menuTable
            if self.selectedDish.category == "Entrée" {
                //update entree dish qty
                self.menuTableVC.entreeDishes[self.selectedRowInt].qty = Int(self.selectedDishQty.text!)!
                
                //update entree dish isSelected
                self.menuTableVC.entreeDishes[self.selectedRowInt].isSelected = true
                
            } else if self.selectedDish.category == "Main" {
                //update main dish qty
                self.menuTableVC.mainDishes[self.selectedRowInt].qty = Int(self.selectedDishQty.text!)!
                
                //update entree dish isSelected
                self.menuTableVC.mainDishes[self.selectedRowInt].isSelected = true
            } else {
                //update dessert dish qty
                self.menuTableVC.dessertDishes[self.selectedRowInt].qty = Int(self.selectedDishQty.text!)!
                
                //update entree dish isSelected
                self.menuTableVC.dessertDishes[self.selectedRowInt].isSelected = true
                
            }
            
            //Reload Menu table view
            self.menuTableVC.menuTableView.reloadData()
            
            // Collapse EditOrderView and transfer to previously accessed view controller on click
            self.navigationController?.popViewController(animated: true)
        } else {
                // if selectedMenuDish qty is 0, set isSelected to false
                if self.selectedDish.category == "Entrée" {
                    //update entree dish isSelected
                    self.menuTableVC.entreeDishes[self.selectedRowInt].isSelected = false
                    
                } else if self.selectedDish.category == "Main" {
                    //update entree dish isSelected
                    self.menuTableVC.mainDishes[self.selectedRowInt].isSelected = false
                } else {
                    
                    //update entree dish isSelected
                    self.menuTableVC.dessertDishes[self.selectedRowInt].isSelected = false
                    
                }
                
                //Reload Menu table view
                self.menuTableVC.menuTableView.reloadData()
            
                // Collapse EditDishView and transfer to MenuTableView
            self.navigationController?.popViewController(animated: true)
        }
    }
    
}

