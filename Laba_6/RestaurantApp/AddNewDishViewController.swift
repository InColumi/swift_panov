//
//  AddNewDishViewController.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 19/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

class AddNewDishViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    // Create a variable that holds a reference to AdminDishesTableView
    var adminTableViewVC = AdminDishesTableViewController()
    
    // Create a variable that holds an ImagePickerController
    var imagePicker = UIImagePickerController()
    
    // Create a variable that holds the selected category for the new dish
    var selectedCategory : String? = ""
    
    @IBOutlet weak var newDishImage: UIImageView!
    @IBOutlet weak var newDishName: UITextField!
    @IBOutlet weak var newDishCategory: UISegmentedControl!
    @IBOutlet weak var newDishPrice: UITextField!
    @IBOutlet weak var newDishInfo: UITextView!
    
    // Opens iphone photo library when camera icon is tapped
    @IBAction func cameraBtn(_ sender: Any) {
        //Trigger image picker
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    // Add new dish to dishes array
    @IBAction func addNewDishBtn(_ sender: Any) {
        
        // Set selectedCategory when add new dish is tapped
         if self.newDishCategory.selectedSegmentIndex == 0 {
            selectedCategory = "Entrée"
         } else if self.newDishCategory.selectedSegmentIndex == 1 {
            selectedCategory = "Main"
         } else {
            selectedCategory = "Dessert"
        }
        
        // Convert Price String input into compatible Double data type for Dish object parameter
        var convertedPrice = 0.00
        if newDishPrice.text! == "" {
            convertedPrice = 0.00
        } else {
            convertedPrice = Double(newDishPrice.text!)!
        }
        
        
        var newDish : Dish
        if (newDishName.text!.isEmpty == false) {
            // Instatiate a new Dish object
            newDish = Dish(image: newDishImage.image!, name: newDishName.text!, category: selectedCategory!, qty: 0, price: convertedPrice, isSelected: false, info : newDishInfo.text!)
            // Add newDish object to dishes array in AdminDishesTableViewController
            if selectedCategory == "Entrée" {
                adminTableViewVC.entreeDishes.append(newDish)
            } else if selectedCategory == "Main" {
                adminTableViewVC.mainDishes.append(newDish)
            } else {
                adminTableViewVC.dessertDishes.append(newDish)
            }
            // Reload data of the TableView
            adminTableViewVC.dishesTableView.reloadData()
            
            // Collapse AddNewDishView and transfer to AdminDishesTableView on click
            navigationController?.popViewController(animated: true)
        } else {
            
            let alertController = UIAlertController(title:
                "Error Adding New Dish", message: "All input fields must be filled out",
                                      preferredStyle: .alert)
            
            let alertAction = UIAlertAction(title: "Ok", style:
                .cancel, handler: nil)
            alertController.addAction(alertAction)
            present(alertController, animated: true, completion:
                nil)
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Handle selected image from imagePicker
        imagePicker.delegate = self
        
    }
    
    //Set the UIImageView to the chosen image from the iphone camera roll
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            newDishImage.image = chosenImage
        }
        
        //Collapses image picker view when an image has been chosen from the camera roll
        imagePicker.dismiss(animated: true, completion: nil)
    }

}
