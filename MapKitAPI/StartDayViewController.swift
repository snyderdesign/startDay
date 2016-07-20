//
//  ViewController.swift
//  MapKitAPI
//
//  Created by Nghia on 7/20/16.
//  Copyright © 2016 Nghia. All rights reserved.
//

import UIKit

class StartDayViewController: UITableViewController, MapViewControllerDelegate{
    
    var tagNumber = 0
    
    @IBOutlet weak var searchEat: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    func showMap () {
        performSegueWithIdentifier("showMapView", sender: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let destination = segue.destinationViewController as! MapViewController
        destination.delegate = self
        destination.tagNumber = tagNumber

    }
    
    func senderTag(tagNumber: Int) {
        self.tagNumber = tagNumber
        
    }
    
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("selecting \(indexPath.section) & row: \(indexPath.row)")
        tagNumber = Int(indexPath.row+(indexPath.section)*2)
        print(tagNumber)
        showMap()
        
    }
    
}



