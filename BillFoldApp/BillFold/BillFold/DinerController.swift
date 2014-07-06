//
//  DinerController.swift
//  BillFold
//
//  Created by Michael Pourhadi on 7/5/14.
//  Copyright (c) 2014 Michael Pourhadi. All rights reserved.
//

import Foundation

//string.bridgeToObjectiveC().doubleValue

let sharedDinerController = DinerController()

struct diner{
    var name = ""
    var foodItem = [:]
}

class DinerController {
    
    var dinerList = diner[]()
    
    func addDiner (name: String, foodItem: Dictionary <String, String>){
        dinerList.append(diner(name: name, foodItem: foodItem))
    }

}

