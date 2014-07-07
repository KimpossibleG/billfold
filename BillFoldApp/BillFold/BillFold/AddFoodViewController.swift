//
//  AddFoodViewController.swift
//  BillFold
//
//  Created by Michael Pourhadi on 7/7/14.
//  Copyright (c) 2014 Michael Pourhadi. All rights reserved.
//

import UIKit

class AddFoodViewController: UIViewController {

    @IBOutlet var foodItemName: UITextField
    
    @IBOutlet var foodItemPrice:UITextField
    
    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addFoodItem(sender: AnyObject) {
        var itemName = foodItemName.text
        var itemPrice = foodItemPrice.text
        let newFood = parsedFood()
        newFood.food = itemName
        newFood.price = itemPrice
        newFood.counter = 0

        sharedFoodController.foodAndPrices.addObject(newFood)
        navigationController.popViewControllerAnimated(true)
    }
    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
