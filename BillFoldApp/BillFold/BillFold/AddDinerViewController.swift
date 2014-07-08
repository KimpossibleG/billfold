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
    @IBOutlet var addDinerButton: UIButton

    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }
    
    init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: NSBundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        // Custom initialization
    }
    
    override func viewDidLoad() {
        addDinerButton.tintColor = black
        addDinerField.tintColor = black
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //IOS Touch functions
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        self.view.endEditing(true)
    }
    
    //UITextFieldDelegate
    
    func textFieldShouldReturn(textField: UITextField!) -> Bool{
        textField.resignFirstResponder();
        return true
    }
    
    @IBAction func addDinerTap(sender: AnyObject) {
        var dinerName = addDinerField.text
        sharedDinerController.addDiner(dinerName)
        navigationController.popViewControllerAnimated(true)
    }
}
