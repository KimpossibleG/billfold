//
//  RegexController.swift
//  BillFold
//
//  Created by Kim Girard on 2014-07-07.
//  Copyright (c) 2014 Michael Pourhadi. All rights reserved.
//

import Foundation
import UIKit

let sharedRegexController = RegexController()

class Regex {
    let internalExpression: NSRegularExpression
    let pattern: String
    
    init(_ pattern: String) {
        self.pattern = pattern
        var error: NSError?
        self.internalExpression = NSRegularExpression(pattern: pattern, options: .CaseInsensitive, error: &error)
    }
    
    func test(input: String) -> Bool {
        let matches = self.internalExpression.matchesInString(input, options: nil, range:NSMakeRange(0, countElements(input)))
        return matches.count > 0
    }
}


class RegexController {
    
    var taxArray:NSMutableArray = NSMutableArray()
    var foodsToDelete:NSMutableArray = NSMutableArray()

    func deleteNonFood(arrayOfFoodsPrices: NSMutableArray) {
        for (index, foodObject) in enumerate(arrayOfFoodsPrices) {
            if Regex("t[o0]ta[li1]").test(foodObject.food) {
                var deletedFood = arrayOfFoodsPrices.removeObject(foodObject);
            }
//            if Regex("visa").test(foodObject.food) {
//                var deletedFood = arrayOfFoodsPrices.removeObject(foodObject);
//            }
//            if Regex("amex").test(foodObject.food) {
//                var deletedFood = arrayOfFoodsPrices.removeObjectAtIndex(index);
//            }
//            if Regex("####").test(foodObject.food) {
//                var deletedFood = arrayOfFoodsPrices.removeObjectAtIndex(index);
//            }
        }
    }
    
    func summarizeTaxes(arrayOfFoodsPrices: NSMutableArray){
        for (indexNum, foodObject) in enumerate(arrayOfFoodsPrices) {
            if Regex("tax").test(foodObject.food) {
                var theTax:NSMutableArray = NSMutableArray()
                theTax.addObject(foodObject)
                arrayOfFoodsPrices.removeObjectAtIndex(indexNum)
            }
        }
        
    }
    
}

