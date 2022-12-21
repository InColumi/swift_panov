//
//  MenuTableViewCell.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 21/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {
    
    // UIOutlets
    @IBOutlet weak var menuImage: UIImageView!
    @IBOutlet weak var menuName: UILabel!
    @IBOutlet weak var menuPrice: UILabel!
    @IBOutlet weak var menuSwitch: UISwitch!
    
    // Subclass that accepts parameters to initialize menuCell
    class menuCell: NSObject {
        
        var mImage : UIImage
        var mName : String
        var mPrice : Double
        var mQty : Int
        var mSwitchValue : Bool
        
        init(image : UIImage, name : String, price : Double, qty : Int, sw : Bool) {
            
            self.mImage = image
            self.mName = name
            self.mPrice = price
            self.mQty = qty
            self.mSwitchValue = sw
        }
    }
    
    //A function to populate a menu cell with the
    //value of a dish object
    
    func setDish(dish : Dish) {
        
        menuImage.image = dish.image
        menuName.text = dish.name
        menuPrice.text = "$ " + String(format: "%.2f", dish.price)
        menuSwitch.isOn = dish.isSelected
        menuSwitch.isEnabled = false
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
