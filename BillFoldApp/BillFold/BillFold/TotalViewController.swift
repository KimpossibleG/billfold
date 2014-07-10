//
//  TotalViewController.swift
//  BillFold
//
//  Created by Rick Dsida on 7/6/14.
//  Copyright (c) 2014 Michael Pourhadi. All rights reserved.
//

import UIKit

class TotalViewController: UITableViewController {
    
    var index = 0

    init(style: UITableViewStyle) {
        super.init(style: style)
        // Custom initialization
    }
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewDidAppear(animated: Bool){
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // delete item from specific user
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        
        var currentDiner = sharedDinerStorage.dinerList[indexPath.section]
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            let item = sharedDinerStorage.dinerList[indexPath.section].foodItems[indexPath.row] as ParsedFood
            item.counter -= 1
            currentDiner.foodItems.removeAtIndex(indexPath.row)
        }
        self.tableView.reloadData()
    }
    
    
    // #pragma mark - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return sharedDinerStorage.dinerList.count
    }
    override func tableView(tableView: UITableView!, titleForHeaderInSection section: Int) -> String {
        var currentDiner = sharedDinerStorage.dinerList[section].name
        var totalOwed = sharedDinerStorage.dinerList[section].totalOwed
        
        var nameAndTotal = "\(currentDiner) — Owes: $\(totalOwed)"
        return nameAndTotal as String
    }
    
    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return sharedDinerStorage.dinerList[section].foodItems.count
    }

    
    override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell? {
        
        var totalCell = tableView?.dequeueReusableCellWithIdentifier("dinerAndTotal",forIndexPath: indexPath) as UITableViewCell
        
        let specificDiner = sharedDinerStorage.dinerList[indexPath.section]
        
        let specificFoodItem = specificDiner.foodItems[indexPath.row].food as String
        let specificFoodPrice = specificDiner.foodItems[indexPath.row].price as NSString
        let price = specificFoodPrice.doubleValue
        let foodCount = specificDiner.foodItems[indexPath.row].counter
        let yourSplit = price/Double(foodCount)
        let total = floor(yourSplit * 100)/100
        
        totalCell.textLabel.text = "Total = \(specificDiner.totalOwed)"
        totalCell.text = specificFoodItem
        totalCell.detailTextLabel.text = "Cost: $\(total)"
        
        return totalCell
    }
    

}
