//
//  ViewController.swift
//  MapKitAPI
//
//  Created by Nghia on 7/20/16.
//  Copyright © 2016 Nghia. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var imageViewSea: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.sendSubviewToBack(imageViewSea)
    }

    
    

}

