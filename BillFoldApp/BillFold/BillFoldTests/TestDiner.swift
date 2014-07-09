//
//  TestDiner.swift
//  BillFold
//
//  Created by Kim Girard on 2014-07-09.
//  Copyright (c) 2014 Michael Pourhadi. All rights reserved.
//

import XCTest
import BillFold

class TestDiner: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    var diner = Diner(name: "Kevin")

    func testDinerWithZeroFoodItems(){
        XCTAssert(diner.totalOwed == 0.0, "Sum of food items did not equal 0")
    }

    func testDinerWithOneFoodItem(){
        let testFoodItem = ParsedFood()
        testFoodItem.food = "Banana"
        testFoodItem.price = "43.39"
        testFoodItem.counter = 1
        
        diner.foodItems += testFoodItem
        XCTAssert(diner.totalOwed == 43.39, "\(diner.totalOwed) did not equal 43.39")
    }
    
    func testDinerWithMultipleFoodItems(){
        let testFoodItem = ParsedFood()
        testFoodItem.food = "Banana"
        testFoodItem.price = "43.01"
        testFoodItem.counter = 1
        
        let testFoodItem2 = ParsedFood()
        testFoodItem2.food = "Frog Legs"
        testFoodItem2.price = "3.01"
        testFoodItem2.counter = 1
        
        diner.foodItems += [testFoodItem, testFoodItem2]
        XCTAssert(diner.totalOwed == 46.02, "\(diner.totalOwed) did not equal 46.02")
    }
    
    func testDinerWithItemSharedThreeWays(){
        let testFoodItem = ParsedFood()
        testFoodItem.food = "Banana"
        testFoodItem.price = "9.99"
        testFoodItem.counter = 3
    
        diner.foodItems += testFoodItem
        XCTAssert(diner.totalOwed == 3.33, "\(diner.totalOwed) did not equal 3.33")
    }
    
}

//var totalOwed: Double {
//get {
//    var sum = 0.0
//    
//    for item in foodItems {
//        let priceString = item.price as NSString
//        let price = priceString.doubleValue
//        let share = price/Double(item.counter)
//        sum = sum + share
//    }
//    
//    return floor(sum * 100)/100
//}
//}