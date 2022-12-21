//
//  Dish.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 19/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import Foundation
import UIKit

// Create a Dish object that contains
// the following properties: name, category, qty, price, isSelected
class Dish : NSObject {
    
    var image : UIImage = UIImage(named: "default-dish")!
    var name : String = ""
    var category : String = "Entrée"
    var qty : Int = 0
    var price : Double = 0.00
    var isSelected : Bool = false
    var info : String = ""
    
    // initialize Dish object
    init ( image : UIImage, name : String, category : String, qty: Int, price : Double, isSelected: Bool, info : String) {
        
        self.image = image
        self.name = name
        self.category = category
        self.qty = qty
        self.price = price
        self.isSelected = isSelected
        self.info = info
    }
}
