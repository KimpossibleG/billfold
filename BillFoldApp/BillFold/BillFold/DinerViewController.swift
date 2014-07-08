//
//  Created by Michael Pourhadi on 7/3/14.
//  Copyright (c) 2014 Michael Pourhadi. All rights reserved.
//

import UIKit
import GPUImage

class DinerViewController: UITableViewController {

    var currentDinerIndex:NSInteger = NSInteger()

    init(coder aDecoder: NSCoder!) {
        super.init(coder: aDecoder)
    }

    init(style: UITableViewStyle) {
        super.init(style: style)

        // Custom initialization
    }

    override func tableView(tableView: UITableView!, didHighlightRowAtIndexPath indexPath: NSIndexPath!) {
        currentDinerIndex = indexPath!.row
    }

    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if segue.destinationViewController is FoodTableViewController {
            var foodTableControllerWithName = segue.destinationViewController as FoodTableViewController
            foodTableControllerWithName.currentDinerIndex = currentDinerIndex
        }
    }
    override func tableView(tableView: UITableView!, canEditRowAtIndexPath indexPath: NSIndexPath!) -> Bool {
        return true
    }

    override func tableView(tableView: UITableView!, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath!) {
        if (editingStyle == UITableViewCellEditingStyle.Delete) {
            var deletePerson = indexPath.row
            sharedDinerController.dinerList.removeAtIndex(deletePerson)
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        //if image.size.width != 0.0 {
            //var pic:UIImage = UIImage(named: "photo2.JPG")
            //var rotatedPhoto:UIImage = UIImage(CGImage: pic.CGImage, scale: 1.0, orientation: UIImageOrientation.Right)
            //TesseractController.recognizeImage(rotatedPhoto)
//            testFilters()
        //}

        var image:UIImage = UIImage(named: "receipt_kg.JPG")
        var imageString:NSString = TesseractController.recognizeImage(image) as NSString
        var foodCollection = TesseractController.regexDo(imageString)
        println(foodCollection)
        sharedFoodController.foodAndPrices = foodCollection

        sharedRegexController.deleteSubtotal(foodCollection)
        sharedRegexController.summarizeTaxes(foodCollection)

    }

    override func viewDidAppear(animated: Bool){
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        return sharedDinerController.dinerList.count
    }

    override func tableView(tableView: UITableView?, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell? {
        let dinerCell = tableView!.dequeueReusableCellWithIdentifier("diner", forIndexPath: indexPath) as UITableViewCell

        dinerCell.text = sharedDinerController.dinerList[indexPath.row].name

        return dinerCell
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

func processImage(filter:AnyObject, photo:UIImage) -> UIImage {
    //this orients the picture relative to the picture's "up"
    //var rotatedPhoto:UIImage = UIImage(CGImage: photo.CGImage, scale: 1.0, orientation: UIImageOrientation.Right)
    return filter.imageByFilteringImage(photo)
}

func testFilters() {
    // sharpness: The sharpness adjustment to apply (-4.0 - 4.0, with 0.0 as the default)
    var sharpenFilter: GPUImageSharpenFilter = GPUImageSharpenFilter()
    sharpenFilter.sharpness = -1.0

    // threshold: The luminance threshold, from 0.0 to 1.0, with a default of 0.5
    var luminanceThresholdFilter: GPUImageLuminanceThresholdFilter = GPUImageLuminanceThresholdFilter()
    //luminanceThresholdFilter.threshold = 0.5

    // thresholdMultiplier: This is a factor that the average luminance will be multiplied by in order to arrive at the final threshold to use. By default, this is 1.0.
    var averageLuminanceThresholdFilter: GPUImageAverageLuminanceThresholdFilter = GPUImageAverageLuminanceThresholdFilter()

    // blurRadiusInPixels: A multiplier for the background averaging blur radius in pixels, with a default of 4.
    var adaptiveThresholdFilter: GPUImageAdaptiveThresholdFilter = GPUImageAdaptiveThresholdFilter()


    var pic:UIImage = UIImage(named: "photo 6.JPG")

    for var i = 0.0; i < 1.0; i += 0.1 {
        println("Luminance Threshold Filter | threshold=\(i)\n")
        luminanceThresholdFilter.threshold = Float(i)
        println(TesseractController.recognizeImage(processImage(luminanceThresholdFilter, pic)))
    }

    for var i = 0.0; i < 2.0; i += 0.1 {
        println("Average Luminance Threshold Filter | \(i)\n")
        averageLuminanceThresholdFilter.thresholdMultiplier = Float(i)
        println(TesseractController.recognizeImage(processImage(averageLuminanceThresholdFilter, pic)))
    }

    for var i = 1; i < 8; ++i {
        println("Adaptive Luminance Threshold Filter | \(i)\n")
        adaptiveThresholdFilter.blurRadiusInPixels = Float(i)
        println(TesseractController.recognizeImage(processImage(adaptiveThresholdFilter, pic)))
    }
}

func displayImage(photo:UIImage) {
    let appDel:AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
    let imgView:UIImageView = UIImageView(frame: appDel.window!.bounds)
    imgView.image = photo
    appDel.window!.addSubview(imgView)
}

