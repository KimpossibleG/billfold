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
        let currentDiner = sharedDinerStorage.dinerList[currentDinerIndex]
        let selectedFood = sharedFoodController.foodAndPrices[indexPath.row] as ParsedFood
        
        currentDiner.foodItems += selectedFood
    
        selectedFood.counter += 1
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }
    
    // USED IN PARSED FOOD CONTROLLER
    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            var sharedFoodStore = sharedFoodController
            sharedFoodStore.foodAndPrices.removeAtIndex(indexPath.row)
            self.tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var currentDiner = sharedDinerStorage.dinerList[currentDinerIndex]
        let nib = UINib(nibName: "BNRItemCell", bundle: nil)
        self.tableView!.registerNib(nib, forCellReuseIdentifier: "BNRItemCell")
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
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
            
        var foodCell = tableView?.dequeueReusableCellWithIdentifier("BNRItemCell",forIndexPath: indexPath) as BNRItemCell
        
//        if !foodCell {
//            foodCell = BNRItemCell()
//            
//        }
        
        var specificFood = sharedFoodController.foodAndPrices[indexPath.row].food as String
        var specificPrice = sharedFoodController.foodAndPrices[indexPath.row].price as String


        var specificCounter = String(sharedFoodController.foodAndPrices[indexPath.row].counter)
        foodCell.nameLabel.text = specificFood
        foodCell.priceLabel.text = "Cost: $\(specificPrice)"
        foodCell.counterLabel.text = specificCounter
        if sharedFoodController.foodAndPrices[indexPath.row].counter > 0 {
            foodCell.backgroundColor = UIColor.greenColor()
        }
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
