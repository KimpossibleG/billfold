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
    
    var foodAndPrices:NSDictionary = NSDictionary()
    
    func calcTotals() {
        var totalForDiner = Double()
            
        var currentListOfDiners = sharedDinerController.dinerList
            
        for diner in currentListOfDiners {
            for foodItemPrice in diner.foodItems.allValues {
                var price = foodItemPrice as NSString
                var float = price.doubleValue
                totalForDiner = totalForDiner + float
                }
            }
        
    }
}