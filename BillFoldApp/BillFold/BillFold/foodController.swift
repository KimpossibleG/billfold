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
    
    func calcTotals() {
        var dinersAndFoodAndPrices = [["mikee": ["quinoa": 15.99, "tofu": 12.39]], ["rick": ["hamburger": 20.29]]]
        var totalPerPerson = 0.00
        var name = ""
        
        for diner in dinersAndFoodAndPrices {
            for (dinerName, foodItems) in diner {
                name = dinerName
                totalPerPerson = 0.00
                for (foodItem, price) in foodItems {
                    totalPerPerson = totalPerPerson + price
                }
            }
            println("total price for \(name): \(totalPerPerson)")
        }
        
        
    }
    
}