//
//  RegexController.swift
//  BillFold
//
//  Created by Kim Girard on 2014-07-07.
//  Copyright (c) 2014 Michael Pourhadi. All rights reserved.
//

import Foundation

let sharedRegexController = RegexController()

class RegexController {

    var taxDictionary:NSMutableDictionary = NSMutableDictionary()

    var originalDictionary = [
        "M.C iXXXXXXXXXXXX1260": "5.19",
        "Subtotai ": ".70",
        "Tax": "0.49",
        "SUB TOTAL ":  "2.34",
        "Sales Tx": "23.34",
        "Subtotal" : "34.34",
        "Tax" : "2.25",
        "SUBTOTAL":  "2.25",
        "Tax 1" : "2.25",
        "IL 2.25% TAX" :  "2.25",
        "IL 9.25% TAX" :  "2.25",
        "TAX1" :  "2.25",
        "BAL FWD" :  "2.25",
        "MDSE ST" :  "2.25",
        "Sub. Total:" :  "2.25",
        "Food (X) Tax" :  "2.25",
        "Sub Total" :  "2.25",
        "hot dog" :  "4.00",
        "Jell-O" :  "3.30"
    ]

    func moveSubtotals() {
        for (food:String, price:String) in originalDictionary {
            if food == "Subtotal"{
                println("The value of Subtotal is \(price)")}
        }
        println(originalDictionary)
    }

}