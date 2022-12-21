//
//  AdminDishesTableViewController.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 18/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

//This class handles the TableView of the Admin user

class AdminDishesTableViewController: UITableViewController {

    @IBOutlet var dishesTableView: UITableView!
    
    // Create an array that contains Dish objects
    var entreeDishes : [Dish] = []
    var mainDishes : [Dish] = []
    var dessertDishes : [Dish] = []
    
    // Create a variable that holds the indexPath of a selected cell to be passed on to a segue
    var indexPathSelected : Int = 0
    
    // Implement a segue for addBtn to move to Add New Dish form view
    @IBAction func addBtn(_ sender: Any) {
        performSegue(withIdentifier: "addNewDishSegue", sender: nil)
    }
    
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
    
    //Set number of sections for TableView
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
        let dish = indexPath.section
        var dishInfo : Dish
        
        // Display dish object in its designated section
        if dish == 0 {
            dishInfo = entreeDishes[indexPath.row]
        } else if dish == 1 {
            dishInfo = mainDishes[indexPath.row]
        } else {
            dishInfo = dessertDishes[indexPath.row]
        }
        
        // Populate a cell with the values of the current dish object
        let cell = tableView.dequeueReusableCell(withIdentifier: "dishCell", for: indexPath) as! DishTableViewCell

            // Call the setDish function of the DishTableViewCell class
            // and pass current dish object to populate cell properties
            cell.setDish(dish: dishInfo)
        
        return cell
    }
    
    // Prepares segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Override to prepare segue and pass reference of this ViewController to AddNewDishViewController and EditDishViewController
        if let addNewDishVC = segue.destination as? AddNewDishViewController {
            addNewDishVC.adminTableViewVC = self
        }
        if let editDishVC = segue.destination as? EditDishViewController {
            if let dish = sender as? Dish {
                editDishVC.selectedDish = dish
                editDishVC.adminTableViewVC = self
                editDishVC.selectedRowInt = indexPathSelected
            }
        }
        
    }
    
    // Allows table cells to be editable
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    // Implement delete function when user swipes left on a table cell
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
                
            // Check section number index
            let dish = indexPath.section
            
            // Display dish object in its designated section
            if dish == 0 {
                entreeDishes.remove(at: indexPath.row)
            } else if dish == 1 {
                mainDishes.remove(at: indexPath.row)
            } else {
                dessertDishes.remove(at: indexPath.row)
            }
        dishesTableView.reloadData()
        }
    }
    
    // Transfer to EditDishView when cell row is selected
   override func tableView(_ tableView: UITableView, didSelectRowAt
        indexPath: IndexPath) {
    
        // Check section number index
        let dish = indexPath.section
        // Get the row number for selected on the TableView
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
    
        // Move to EditDishViewController to modify selected dish item
        performSegue(withIdentifier: "editDishSegue", sender: dishInfo)
    }
    
    @IBAction func viewStaffOrders(_ sender: Any) {
        performSegue(withIdentifier: "viewStaffOrders", sender: nil)
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
