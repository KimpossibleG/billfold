//
//  AddViewController.swift
//  TodoApp
//
//  Created by Michael Pourhadi on 7/3/14.
//  Copyright (c) 2014 Michael Pourhadi. All rights reserved.
//

import UIKit

class AddDinerViewController: UIViewController {
    
    @IBOutlet strong var addDinerField: UITextField = UITextField()
    
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
    
    @IBAction func addDinerTap(sender: AnyObject) {
        var dinerName = addDinerField.text
        sharedDinerController.addDiner(dinerName, foodItem: [:])
        navigationController.popViewControllerAnimated(true)
    }
}
