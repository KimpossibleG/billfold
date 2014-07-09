//
//  ParsedReceiptTableViewController.swift
//  BillFold
//
//  Created by Michael Pourhadi on 7/9/14.
//  Copyright (c) 2014 Michael Pourhadi. All rights reserved.
//

import UIKit

class ParsedReceiptViewController: UITableViewController {

    let doneButton = UIBarButtonItem()
    let addFoodButton = UIBarButtonItem()
    
    func doneButtonTap(sender: UIButton!) {
        navigationController.dismissModalViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.multipleTouchEnabled = true
        addFoodButton.title = "Add Item To Receipt"
        addFoodButton.target = self
        addFoodButton.action = "addButtonTap:"
        self.navigationItem.rightBarButtonItem = doneButton
        self.navigationItem.title = "Select items to keep"
        doneButton.style = UIBarButtonItemStyle.Plain
        doneButton.title = "Done"
        doneButton.target = self
        doneButton.action = "doneButtonTap:"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(tableView: UITableView!, didHighlightRowAtIndexPath indexPath: NSIndexPath!) {
        var selectedFood = sharedFoodController.foodAndPrices[indexPath.row] as ParsedFood
        
    }
    
    // #pragma mark - Table view data source
    
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            var sharedFoodStore = sharedFoodController
            sharedFoodStore.foodAndPrices.removeAtIndex(indexPath.row)
        }
        self.tableView.reloadData()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return sharedFoodController.foodAndPrices.count
    }
    
    override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell? {
        
        let foodCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "foodItem") as UITableViewCell
        
        let specificFoodItem = sharedFoodController.foodAndPrices[indexPath.row].food
        let price = sharedFoodController.foodAndPrices[indexPath.row].price

        
        foodCell.text = specificFoodItem
        foodCell.detailTextLabel.text = "Cost: $\(price)"
        
        return foodCell
    }
}
