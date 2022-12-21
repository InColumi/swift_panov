//
//  MenuTableViewController.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 21/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

//This class handles the TableView of the Wait Staff user

class MenuTableViewController: UITableViewController {
    
    @IBOutlet var menuTableView: UITableView!
    
    // Create a variable that holds a reference to WaitStaffIDView
    var previousVC = WaitStaffIDViewController()
    
    // Create a variable to hold the selectedID from WaitStaffIDTableView
    var selectedID : Int = 0
    
    // Create an array that contains Dish objects
    var entreeDishes : [Dish] = []
    var mainDishes : [Dish] = []
    var dessertDishes : [Dish] = []
    
    // Create a variable that holds the indexPath of a selected cell to be passed on to a segue
    var indexPathSelected : Int = 0
    
    // EditView segue identifier
    let editViewSegueIdentifier = "addOrderSegue"

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Call createArray function and populate the dishes array
        entreeDishes = createEntreeArray()
        mainDishes = createMainArray()
        dessertDishes = createDessertArray()

    }
    
    // A function that creates a temporary array containing Entree Dish objects
    // which will be passed into the entree dishes array
    func createEntreeArray() -> [Dish] {
        
        // Create a temporary array containing Dish objects
        var temporaryDishes : [Dish] = []
        
        // Create 3 Dish objects: dish1, dish2, dish3
        let dish1 = Dish(image: UIImage(named: "potstickers")!, name: "Potstickers", category: "Entrée", qty: 0, price: 6.00, isSelected: false, info: "a Chinese wonton dumpling which is fried until brown on one side, then turned and simmered in a small amount of broth")
        let dish2 = Dish(image: UIImage(named: "xiao-long-bao")!, name: "Xiao long bao", category: "Entrée", qty: 0, price: 8.00, isSelected: false, info: "a Chinese steamed bun (baozi) from the Jiangnan region. Also called a 'soup dumpling' because they are filled with hot soup")
        let dish3 = Dish(image: UIImage(named: "spring-rolls")!, name: "Spring rolls", category: "Entrée", qty: 0, price: 6.00, isSelected: false, info: "a deep fried dim sum filled with vegetables and meat")
        
        // Add Dish objects into the temporaryDishes array
        temporaryDishes.append(dish1)
        temporaryDishes.append(dish2)
        temporaryDishes.append(dish3)
        
        // return a Dish array when this function is called
        return temporaryDishes
    }
    
    // A function that creates a temporary array containing Main Dish objects
    // which will be passed into the main dishes array
    func createMainArray() -> [Dish] {
        
        // Create a temporary array containing Dish objects
        var temporaryDishes : [Dish] = []
        
        // Create 3 Dish objects: dish1, dish2, dish3
        let dish1 = Dish(image: UIImage(named: "kung-pao-chicken")!, name: "Kung pao chicken", category: "Main", qty: 0, price: 15.00, isSelected: false, info: "a classic Chinese stir-fried chicken dish with the perfect combination of salty, sweet and spicy flavor")
        let dish2 = Dish(image: UIImage(named: "sweet-sour-pork")!, name: "Sweet sour pork", category: "Main", qty: 0, price: 16.00, isSelected: false, info: "a Chinese dish consisting of pork that has been battered and deep-fried, then served with a sweet and sour sauce")
        let dish3 = Dish(image: UIImage(named: "beef-brocoli")!, name: "Beef broccoli stir fry", category: "Main", qty: 0, price: 18.00, isSelected: false, info: "a combination of beef and broccoli fried in a small amount of very hot oil while being stirred in a wok")
        
        // Add Dish objects into the temporaryDishes array
        temporaryDishes.append(dish1)
        temporaryDishes.append(dish2)
        temporaryDishes.append(dish3)
        
        // return a Dish array when this function is called
        return temporaryDishes
    }
    
    // A function that creates a temporary array containing Dessert Dish objects
    // which will be passed into the dessert dishes array
    func createDessertArray() -> [Dish] {
        
        // Create a temporary array containing Dish objects
        var temporaryDishes : [Dish] = []
        
        // Create 3 Dish objects: dish1, dish2, dish3
        let dish1 = Dish(image: UIImage(named: "sesame-balls")!, name: "Sesame balls", category: "Dessert", qty: 0, price: 6.00, isSelected: false, info: "a type of fried Chinese pastry made from glutinous rice flour")
        let dish2 = Dish(image: UIImage(named: "mango-tapioca")!, name: "Mango Tapioca", category: "Dessert", qty: 0, price: 8.00, isSelected: false, info: "a round and dense Chinese pastry with salted egg yolk in the center traditionally eaten during the Mid-Autumn Festival")
        let dish3 = Dish(image: UIImage(named: "mooncake")!, name: "Mooncake", category: "Dessert", qty: 0, price: 10.00, isSelected: false, info: "a sweet, tangy and creamy summer dessert made with mangoes, tapioca pearls, and milk")
        
        // Add Dish objects into the temporaryDishes array
        temporaryDishes.append(dish1)
        temporaryDishes.append(dish2)
        temporaryDishes.append(dish3)
        
        // return a Dish array when this function is called
        return temporaryDishes
    }

    // MARK: - Table view data source
    
    //Set the headers for each TableView section
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel()
        label.backgroundColor = UIColor.black
        label.textColor = UIColor.white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 18.0)
        
        if section == 0 {
            label.text = "Entree Dishes"
        } else if section == 1 {
            label.text = "Main Dishes"
        } else {
            label.text = "Dessert Dishes"
        }
        
        return label
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            //Set number of table view rows for Entree section according to number of items in entree dishes array
            return entreeDishes.count
        } else if section == 1 {
            //Set number of table view rows for Main section according to number of items in main dishes array
            return mainDishes.count
        } else {
            //Set number of table view rows for Dessert section according to number of items in dessert dishes array
            return dessertDishes.count
        }
        
    }
    
    // Populate each table view cell with a specific dish object
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Check section number index
        let dishCategory = indexPath.section
        var dishInfo : Dish
        
        // Display dish object in its designated section
        if dishCategory == 0 {
            dishInfo = entreeDishes[indexPath.row]
        } else if dishCategory == 1 {
            dishInfo = mainDishes[indexPath.row]
        } else {
            dishInfo = dessertDishes[indexPath.row]
        }
        
        // Populate a cell with the values of the current dish object
        let cell = tableView.dequeueReusableCell(withIdentifier: "menuCell", for: indexPath) as! MenuTableViewCell
        
        // Call the setDish function of the MenuTableViewCell class
        // and pass current dish object to populate cell properties
        cell.setDish(dish: dishInfo)
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt
        indexPath: IndexPath) {
        
        // Check section number index
        let dish = indexPath.section
        // Get the row number for selected dish on the TableView
        let indexPathRow = tableView.indexPathForSelectedRow!
        // Store indexPathRow to global variable
        indexPathSelected = indexPathRow.row
        var dishInfo : Dish
        
        // Display dish object in its designated section
        if dish == 0 {
            dishInfo = entreeDishes[indexPathSelected]
        } else if dish == 1 {
            dishInfo = mainDishes[indexPathSelected]
        } else {
            dishInfo = dessertDishes[indexPathSelected]
        }
        
        // Move to EditOrderViewController to set order quantity of selected dish item
        
        performSegue(withIdentifier: editViewSegueIdentifier, sender: dishInfo)
    }
    
    // Prepares segue to EditOrderViewController
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Override to prepare segue and pass reference of this ViewController to EditOrderViewController
        if let editDishVC = segue.destination as? EditOrderViewController {
            if let dish = sender as? Dish {
                editDishVC.selectedDish = dish
                editDishVC.menuTableVC = self
                editDishVC.selectedRowInt = indexPathSelected
            }
        }
        
        if let submitOrderVC = segue.destination as? OrderSummaryViewController {
            if let order = sender as? [Dish] {
                submitOrderVC.orderedDishes = order
                submitOrderVC.selectedID = selectedID
                submitOrderVC.previousVC = self
            }
        }
    }
    
    // When add order is clicked, pass "true" switch value items to orderSummary
    @IBAction func addOrderBtn(_ sender: Any) {
    
        var selectedDishes : [Dish] = []
       
        //Check selected items in Entree Section
        let entreeRowCount = menuTableView.numberOfRows(inSection: 0)
        
        for row in 0...entreeRowCount - 1 {
            if entreeDishes[row].isSelected == true {
                // Add dish item to selectedDishes array
                selectedDishes.append(entreeDishes[row])
            }
        }
        
        //Check selected items in Main Section
        let mainRowCount = menuTableView.numberOfRows(inSection: 1)
        
        for row in 0...mainRowCount - 1 {
            if mainDishes[row].isSelected == true {
                // Add dish item to selectedDishes array
                selectedDishes.append(mainDishes[row])
            }
        }
        
        //Check selected items in Dessert Section
        let dessertRowCount = menuTableView.numberOfRows(inSection: 1)
        
        for row in 0...dessertRowCount - 1 {
            if dessertDishes[row].isSelected == true {
                // Add dish item to selectedDishes array
                selectedDishes.append(dessertDishes[row])
            }
        }
        
        performSegue(withIdentifier: "submitOrder", sender: selectedDishes)
        
    }
    
    // When folder icon is clicked, perform segue to view all orders
    
    @IBAction func viewOrdersBtn(_ sender: Any) {
        performSegue(withIdentifier: "orderHistory", sender: nil)
    }
}

