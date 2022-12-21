//
//  ReorderTableViewCell.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 22/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

class ReorderTableViewCell: UITableViewCell {
    
    @IBOutlet weak var dishName: UILabel!
    @IBOutlet weak var dishQty: UILabel!
    @IBOutlet weak var orderPrice: UILabel!
    @IBOutlet weak var qtyStepper: UIStepper!
    
    //A function to populate a dish cell with the
    //value of a dish object
    
    func setOrder(dish : Dish) {
        
        dishName!.text = dish.name
        dishQty!.text = String(dish.qty)
        
        //Calculate total price of ordered dish
        let orderCost = Double(dish.qty) * dish.price
        orderPrice!.text = "$ " + String(format: "%.2f", orderCost)
        
        qtyStepper.value = Double(dish.qty)
        
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
