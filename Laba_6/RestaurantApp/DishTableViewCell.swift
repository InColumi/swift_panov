//
//  DishTableViewCell.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 19/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit


class DishTableViewCell: UITableViewCell {

    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var dishName: UILabel!
    @IBOutlet weak var dishCategory: UILabel!
    @IBOutlet weak var dishPrice: UILabel!
    
    
    //A function to populate a dish cell with the
    //value of a dish object
    
    func setDish(dish : Dish) {
        
        dishImage.image = dish.image
        dishName.text = dish.name
        dishCategory.text = dish.category
        dishPrice.text = "$ " + String(format: "%.2f", dish.price)
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
