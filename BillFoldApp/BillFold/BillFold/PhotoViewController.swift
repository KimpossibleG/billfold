//
//  ViewController.swift
//  MyCamera
//
//  Created by Rick Dsida on 7/4/14.
//  Copyright (c) 2014 Rick Dsida. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var selectedImage:UIImage = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoButton.title = "Photo"
       
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
    
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        let destinationTableViewController = segue.destinationViewController as DinerViewController
        destinationTableViewController.image = selectedImage
    }
    
    // Delegate Methods
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!) {
        self.image!.image = image as UIImage
        self.dismissModalViewControllerAnimated(true)
        selectedImage = image as UIImage
        Continue.hidden = false
        Instructions.hidden = true
        Welcome.hidden = true
    }
    
    
    
    
}