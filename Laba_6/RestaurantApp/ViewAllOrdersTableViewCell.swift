//
//  ViewAllOrdersTableViewCell.swift
//  RestaurantApp
//
//  Created by Alinia Mabatid on 22/10/2019.
//  Copyright © 2019 UWS. All rights reserved.
//

import UIKit

class ViewAllOrdersTableViewCell: UITableViewCell {

    @IBOutlet weak var orderNumber: UILabel!
    @IBOutlet weak var tableNumber: UILabel!
    @IBOutlet weak var staffNumber: UILabel!
    @IBOutlet weak var orderTotal: UILabel!
    
    //A function to populate a menu cell with the
    //value of a dish object
    
    func setOrder(order : Order) {
        
        orderNumber.text = "Order Number: \(order.orderNumber)"
        tableNumber.text = "Table Number: " + String(order.tableNumber)
        staffNumber.text = "Staff Number: " + String(order.staffNumber)
        orderTotal.text = "$ " + String(format: "%.2f", order.orderTotal)
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
