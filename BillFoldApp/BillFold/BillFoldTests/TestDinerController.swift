//
//  TestDinerStorage.swift
//  BillFold
//
//  Created by Kim Girard on 2014-07-09.
//  Copyright (c) 2014 Michael Pourhadi. All rights reserved.
//

import XCTest
import BillFold


class TestDinerStorage: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    let diner1 = Diner(name: "Kevin")
    let diner2 = Diner(name: "Bubba")
    var testDinerList =
    
    func testAddDinerOne(){
        dinerStorage.addDiner("Kim")
        XCTAssert(, <#message: String#>, file: <#String#>, line: <#Int#>)
    }

}
//
//class DinerStorage {
//    
//    var dinerList = Diner[]()
//    
//    func addDiner (name: String){
//        dinerList.append(Diner(name: name))
//    }
//    
//}

//func testDinerWithOneFoodItem(){
//    let testFoodItem = ParsedFood()
//    testFoodItem.food = "Banana"
//    testFoodItem.price = "43.39"
//    testFoodItem.counter = 1
//    
//    diner.foodItems += testFoodItem
//    XCTAssert(diner.totalOwed == 43.39, "\(diner.totalOwed) did not equal 43.39")
//}