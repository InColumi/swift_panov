//
//  OrderTableViewCell.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 20/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

class OrderTableViewCell: UITableViewCell {

    @IBOutlet weak var dishName: UILabel!
    @IBOutlet weak var dishQty: UILabel!
    @IBOutlet weak var orderPrice: UILabel!
    
    //A function to populate a dish cell with the
    //value of a dish object
    
    func setOrder(dish : Dish) {
        
        dishName!.text = dish.name
        dishQty!.text = "x" + String(dish.qty)
        
        //Calculate total price of ordered dish
        let orderCost = Double(dish.qty) * dish.price
        orderPrice!.text = "$ " + String(format: "%.2f", orderCost)
        
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
