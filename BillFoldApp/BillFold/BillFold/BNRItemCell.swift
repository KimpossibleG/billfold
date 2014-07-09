//
//  BNRItemCell.swift
//  BillFold
//
//  Created by Mikee Pourhadi on 7/9/14.
//  Copyright (c) 2014 Michael Pourhadi. All rights reserved.
//

import UIKit

class BNRItemCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet var nameLabel: UILabel
    @IBOutlet var priceLabel: UILabel
    @IBOutlet var counterLabel: UILabel
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
