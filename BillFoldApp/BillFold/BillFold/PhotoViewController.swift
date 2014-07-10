//
//  ViewController.swift
//  MyCamera
//
//  Created by Rick Dsida on 7/4/14.
//  Copyright (c) 2014 Rick Dsida. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.WhiteLarge)
    var overLayLoader = UIView()
    
    @IBAction func buttonTap(sender: AnyObject) {
        
    }

    // FONT STLYING //
    let attributeDictionary = [UITextAttributeTextColor: UIColor.whiteColor(), UITextAttributeFont: UIFont(name: "Noteworthy-Bold", size: 35)]
    
    func makeSpinner() {
        overLayLoader.frame = UIScreen.mainScreen().bounds
        overLayLoader.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.5)
        activityIndicator.startAnimating()
        activityIndicator.center = overLayLoader.center
        overLayLoader.addSubview(activityIndicator)
        navigationController.view.addSubview(overLayLoader)
        overLayLoader.hidden = true
    }
    
//    override func shouldPerformSegueWithIdentifier(identifier: String!, sender: AnyObject!) -> Bool {
//        if self.image!.image == nil {
//            photoAlert()
//            return false
//        } else {
//            return true
//        }
//    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        var segueImage:UIImage = UIImage(named: "photo.JPG")
        var imageString:NSString = TesseractController.recognizeImage(segueImage) as NSString
        var foodCollection = TesseractController.regexDo(imageString)
        foodCollection.enumerateObjectsUsingBlock(
            {
                (obj, index, pointer) -> Void in
                sharedFoodController.foodAndPrices += obj as ParsedFood
            }
        )
        sharedRegexController.deleteNonFood(foodCollection)
        sharedRegexController.summarizeTaxes(foodCollection)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Outlets
    @IBOutlet var photoButton: UIBarButtonItem
    @IBOutlet var Instructions: UILabel
    @IBOutlet var Continue: UILabel
    @IBOutlet var Welcome: UILabel
    @IBOutlet var image: UIImageView?
    @IBOutlet var doneButton: UIBarButtonItem
    @IBOutlet var choosePhotoButton: UIBarButtonItem
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController.navigationBar.setTitleVerticalPositionAdjustment(8, forBarMetrics: UIBarMetrics.Default)
        self.view.backgroundColor = lightBlue
        self.navigationItem.title = "BillFold"
        navigationController.navigationBar.titleTextAttributes = attributeDictionary
        photoButton.title = "Photo"
        navigationController.navigationBar.barTintColor = lightColor
    }
    
    
    func photoAlert() {
        var photoAlert = UIAlertController(title: "No Photo Found", message: "Please take a photo", preferredStyle: UIAlertControllerStyle.Alert)
        photoAlert.addAction(UIAlertAction(title: "Okay!", style: UIAlertActionStyle.Default, handler: nil))
         self.presentViewController(photoAlert, animated: true, completion: nil)
    }
    
    // Actions
    
    @IBAction func choosePhoto(sender: UIBarButtonItem) {
        let capture = UIImagePickerController()
        capture.delegate = self
        capture.sourceType = .PhotoLibrary
        self.presentViewController(capture, animated: true, completion: nil)
    }

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
        var cameraOverlayView: UITableView!
    }
    
}