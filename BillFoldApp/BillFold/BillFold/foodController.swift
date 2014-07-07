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
    
    var foodAndPrices:NSMutableDictionary = NSMutableDictionary()
    
    func calcTotals() {
        var totalForDiner = Double()
        var currentListOfDiners = sharedDinerController.dinerList
        
        // for loop for this bullshit
        for index in 0..currentListOfDiners.count {
            totalForDiner = 0.0
            var diner = sharedDinerController.dinerList[index]
            for foodItemPrice in diner.foodItems.allValues {
                var price = foodItemPrice as NSString
                var double = price.doubleValue
                totalForDiner = totalForDiner + double
                sharedDinerController.dinerList[index].totalOwed = totalForDiner
            }
        }
    
    }

}