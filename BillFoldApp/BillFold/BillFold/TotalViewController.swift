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
        sharedFoodController.calcTotals()
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // delete item from specific user
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        
        var currentDiner = sharedDinerController.dinerList[indexPath.section]
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            
            currentDiner.foodItems.removeObjectAtIndex(indexPath.row)
        }
//        println(sharedDinerController.dinerList[indexPath.section].foodItems[indexPath.row])
//        self.tableView.reloadData()
    }
    
    // #pragma mark - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return sharedDinerController.dinerList.count
    }
    override func tableView(tableView: UITableView!, titleForHeaderInSection section: Int) -> String {
        var currentDiner = sharedDinerController.dinerList[section].name
        var totalOwed = sharedDinerController.dinerList[section].totalOwed
        
        var nameAndTotal = "\(currentDiner) — Owed: $\(totalOwed)"
        return nameAndTotal as String
    }
    
    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        return sharedDinerController.dinerList[section].foodItems.count
    }

    
    override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell? {
        
        let totalCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "totalCell") as UITableViewCell
        
        var specificDiner = sharedDinerController.dinerList[indexPath.section]
        
        var specificFoodItem = specificDiner.foodItems[indexPath.row].food as String
        var specificFoodPrice = specificDiner.foodItems[indexPath.row].price as String
        
        totalCell.textLabel.text = "Total = \(specificDiner.totalOwed)"
        totalCell.text = specificFoodItem
        totalCell.detailTextLabel.text = "Cost: $\(specificFoodPrice)"
        
        return totalCell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView?, canEditRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView?, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath?) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView?, moveRowAtIndexPath fromIndexPath: NSIndexPath?, toIndexPath: NSIndexPath?) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView?, canMoveRowAtIndexPath indexPath: NSIndexPath?) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
