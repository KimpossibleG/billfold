//
//  foodController.swift
//  BillFold
//
//  Created by Michael Pourhadi on 7/5/14.
//  Copyright (c) 2014 Michael Pourhadi. All rights reserved.
//

import Foundation

let sharedFoodController = foodController()

class foodController {
    
    var foodAndPrices:NSMutableArray = NSMutableArray()
    
    func calcTotalBill() -> Double {
        var total = 0.0
        for foodItem : AnyObject in foodAndPrices {
            var price = foodItem.price as NSString
            total = total + price.doubleValue
        }
        return total
    }
}