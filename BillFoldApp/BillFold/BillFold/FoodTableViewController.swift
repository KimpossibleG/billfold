//
//  FoodTableViewController.swift
//  BillFold
//
//  Created by Michael Pourhadi on 7/4/14.
//  Copyright (c) 2014 Michael Pourhadi. All rights reserved.
//

import UIKit

class FoodTableViewController: UITableViewController {
    
    var currentDinerIndex:NSInteger = NSInteger()
    
    init(style: UITableViewStyle) {
        super.init(style: style)
        // Custom initialization
    }
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    override func tableView(tableView: UITableView!, didHighlightRowAtIndexPath indexPath: NSIndexPath!) {
        let currentDiner = sharedDinerController.dinerList[currentDinerIndex]
        let selectedFood = sharedFoodController.foodAndPrices[indexPath.row] as ParsedFood
        
        currentDiner.foodItems += selectedFood
    
        selectedFood.counter += 1
        tableView.reloadData()

    }
    
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            sharedFoodController.foodAndPrices.removeObjectAtIndex(indexPath.row)
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        var currentDiner = sharedDinerController.dinerList[currentDinerIndex]
        super.viewDidLoad()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    }
    
    override func viewDidAppear(animated: Bool){
        self.tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        let counterLabel = UILabel()
        counterLabel.text = String(sharedFoodController.foodAndPrices[indexPath.row].counter)
        let counterView = UIView()
        counterView.frame = CGRect(x: 270, y: 10, width: 25, height: 25)
        counterLabel.frame = CGRect(x: 0, y: 0, width: 10, height: 10)
        counterView.backgroundColor = UIColor.grayColor()
        counterView.addSubview(counterLabel)
        counterLabel.center = counterView.center
        foodCell.addSubview(counterView)
        
        var specificFood = sharedFoodController.foodAndPrices[indexPath.row].food as String
        var specificPrice = sharedFoodController.foodAndPrices[indexPath.row].price as String
        
        foodCell.text = specificFood
        foodCell.detailTextLabel.text = "$\(specificPrice)"
        
        return foodCell
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
