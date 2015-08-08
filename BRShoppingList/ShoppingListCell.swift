//
//  ShoppingListCell.swift
//  BRShoppingList
//
//  Created by Bobby Ren on 5/12/15.
//  Copyright (c) 2015 Bobby Ren. All rights reserved.
//

import UIKit

class ShoppingListCell: UITableViewCell {

    @IBOutlet weak var labelName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
