//
//  DinerStorage.swift
//  BillFold
//
//  Created by Michael Pourhadi on 7/5/14.
//  Copyright (c) 2014 Michael Pourhadi. All rights reserved.
//

import Foundation

let sharedDinerStorage = DinerStorage()

class Diner{
    let name:String
    var foodItems = ParsedFood[]()
    
    init(name: String) {
        self.name = name
    }
    
    var totalOwed: Double {
        get {
            var sum = 0.0
            
            for item in foodItems {
                let priceString = item.price as NSString
                let price = priceString.doubleValue
                let share = price/Double(item.counter)
                sum = sum + share
            }
            
            return floor(sum * 100)/100
        }
    }
}

// Why is this a controller? I would name this DinerStore or something along those lines to
// indicate that it is a cache of data instead of an object managing views

class DinerStorage {
    
    var dinerList = Diner[]()
    
    func addDiner (name: String){
        dinerList.append(Diner(name: name))
    }

}

