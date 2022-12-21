//
//  Order.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 22/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import Foundation
import UIKit

// Create an Order object that contains
// the following properties: orderNumber, tableNumber, staffNumber, orderTotal, orderedDishes
class Order : NSObject {
    
    var orderNumber : String = ""
    var tableNumber : Int = 0
    var staffNumber : Int = 0
    var orderTotal : Double = 0.00
    var orderedDishes : [Dish] = []
    
    // initialize Order object
    init ( oNum : String, tNum : Int, sNum : Int, oTotal: Double, oDishes : [Dish]) {
        
        self.orderNumber = oNum
        self.tableNumber = tNum
        self.staffNumber = sNum
        self.orderTotal = oTotal
        self.orderedDishes = oDishes
        
    }
}
