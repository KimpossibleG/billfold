//
//  ViewController.swift
//  MyCamera
//
//  Created by Rick Dsida on 7/4/14.
//  Copyright (c) 2014 Rick Dsida. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let lightColor: UIColor = UIColor(red: 1, green: 0.600, blue: 0, alpha: 1)
    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
    var overLayLoader = UIView()
    
    func makeSpinner() {
        overLayLoader.frame = UIScreen.mainScreen().bounds
        overLayLoader.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        activityIndicator.startAnimating()
        activityIndicator.center = overLayLoader.center
        overLayLoader.addSubview(activityIndicator)
        navigationController.view.addSubview(overLayLoader)
        overLayLoader.hidden = true
    }
    
    func loadImage() {
        
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String!, sender: AnyObject!) -> Bool {
        if self.image!.image === nil {
            return false
        } else {
            return true
        }
    }
    
    override func performSegueWithIdentifier(identifier: String!, sender: AnyObject!) {
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        loadImage()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeSpinner()
        photoButton.title = "Photo"
        navigationController.navigationBar.barTintColor = lightColor
        navigationController.navigationBar
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Outlets
    @IBOutlet var photoButton : UIBarButtonItem
    @IBOutlet var Instructions: UILabel
    @IBOutlet var Continue: UILabel
    @IBOutlet var Welcome: UILabel

    @IBOutlet var image: UIImageView?
    
    
    // Actions
    @IBAction func takePhoto(sender : UIBarButtonItem) {
        let capture = UIImagePickerController()
        capture.delegate = self
        
        if UIImagePickerController.isSourceTypeAvailable(.Camera) {
            
            capture.sourceType = .Camera
        }
        else {
            capture.sourceType = .PhotoLibrary
        }
        self.presentViewController(capture, animated: true, completion: nil)
    }
    
    // Delegate Methods
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!) {
        self.image!.image = image as UIImage
        self.dismissModalViewControllerAnimated(true)
        Continue.hidden = false
        Instructions.hidden = true
        Welcome.hidden = true
    }
    
}