//
//  EditDishViewController.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 20/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

class EditDishViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var selectedDishImage: UIImageView!
    @IBOutlet weak var selectedDishName: UITextField!
    @IBOutlet weak var selectedDishCategory: UISegmentedControl!
    @IBOutlet weak var selectedDishPrice: UITextField!
    @IBOutlet weak var selectedDishInfo: UITextView!
    
    // Create a variable that holds a reference to AdminDishesTableView
    var adminTableViewVC = AdminDishesTableViewController()
    
    // Create variable to accept values passed from AdminDishesTableView
    var selectedDish = Dish(image: UIImage(named: "default-dish")!, name: "", category: "", qty: 0, price: 0.00, isSelected: false, info:"")
    
    // Create variable to accept index of selectedRow for AdminDishesTableView
    var selectedRowInt : Int = 0
    
    // Create a variable that holds an ImagePickerController
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Handle selected image from imagePicker
        imagePicker.delegate = self
        
        // Set up input fields
        selectedDishImage.image = selectedDish.image
        selectedDishName.text = selectedDish.name
        
        if selectedDish.category == "Entrée" {
            selectedDishCategory.selectedSegmentIndex = 0
            selectedDishCategory.setEnabled(false, forSegmentAt: 1)
            selectedDishCategory.setEnabled(false, forSegmentAt: 2)

        } else if selectedDish.category == "Main" {
            selectedDishCategory.selectedSegmentIndex = 1
            selectedDishCategory.setEnabled(false, forSegmentAt: 0)
            selectedDishCategory.setEnabled(false, forSegmentAt: 2)
        } else {
            selectedDishCategory.selectedSegmentIndex = 2
            selectedDishCategory.setEnabled(false, forSegmentAt: 0)
            selectedDishCategory.setEnabled(false, forSegmentAt: 1)
        }
        
        selectedDishPrice.text = String(format: "%.2f", selectedDish.price)
        
        selectedDishInfo.text = selectedDish.info
        
    }
    @IBAction func editBtn(_ sender: Any) {
        
        // Confirm changes before updating the Dish object
        let alert = UIAlertController(title:
            "Confirm Changes", message: "You are making changes to a dish item. Proceed with changes?",
                                  preferredStyle: .alert)
        
        //If user continues with changes, update dish item
        alert.addAction(UIAlertAction(title: "Confirm", style: UIAlertAction.Style.default, handler:{ action in
            
            if self.selectedDish.category == "Entrée" {
                //  Update the properties of the selected entree dish item
                self.adminTableViewVC.entreeDishes[self.selectedRowInt].name = self.selectedDishName.text!
                self.adminTableViewVC.entreeDishes[self.selectedRowInt].price = Double(self.selectedDishPrice.text!)!
                self.adminTableViewVC.entreeDishes[self.selectedRowInt].image = self.selectedDishImage.image!
                self.adminTableViewVC.entreeDishes[self.selectedRowInt].info = self.selectedDishInfo.text!
                
                //Reload admin table view
                self.adminTableViewVC.dishesTableView.reloadData()
                
                // Collapse EditDishView and transfer to AdminDishesTableView on click
                self.navigationController?.popViewController(animated: true)
                
            } else if self.selectedDish.category == "Main" {
                //  Update the properties of the selected entree dish item
                self.adminTableViewVC.mainDishes[self.selectedRowInt].name = self.selectedDishName.text!
                self.adminTableViewVC.mainDishes[self.selectedRowInt].price = Double(self.selectedDishPrice.text!)!
                self.adminTableViewVC.mainDishes[self.selectedRowInt].image = self.selectedDishImage.image!
                 self.adminTableViewVC.mainDishes[self.selectedRowInt].info = self.selectedDishInfo.text!
                
                //Reload admin table view
                self.adminTableViewVC.dishesTableView.reloadData()
                
                // Collapse EditDishView and transfer to AdminDishesTableView on click
                self.navigationController?.popViewController(animated: true)
                
            } else {
                //  Update the properties of the selected entree dish item
                self.adminTableViewVC.dessertDishes[self.selectedRowInt].name = self.selectedDishName.text!
                self.adminTableViewVC.dessertDishes[self.selectedRowInt].price = Double(self.selectedDishPrice.text!)!
                self.adminTableViewVC.dessertDishes[self.selectedRowInt].image = self.selectedDishImage.image!
                self.adminTableViewVC.dessertDishes[self.selectedRowInt].info = self.selectedDishInfo.text!
                
                //Reload admin table view
                self.adminTableViewVC.dishesTableView.reloadData()
                
                // Collapse EditDishView and transfer to AdminDishesTableView on click
                self.navigationController?.popViewController(animated: true)
            }
            
        }))
        
        //If user cancels changes, do not update dish item
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.destructive, handler: { action in
            
            // Collapse EditDishView and transfer to AdminDishesTableView on click
            self.navigationController?.popViewController(animated: true)
            
        }))

       
        self.present(alert, animated: true, completion:
            nil)
        
        
    }
    
    // Opens iphone photo library when camera icon is tapped
    @IBAction func cameraBtn(_ sender: Any) {
        //Trigger image picker
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    //Set the UIImageView to the chosen image from the iphone camera roll
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let chosenImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.selectedDishImage.image = chosenImage
        }
        
        //Collapses image picker view when an image has been chosen from the camera roll
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
}
