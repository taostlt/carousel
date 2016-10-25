//
//  ViewController.swift
//  Carousel
//
//  Created by Alexander on 10/22/16.
//  Copyright © 2016 Alexander. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var introView: UIImageView!
    @IBOutlet weak var introScroll: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        introScroll.contentSize = introView.frame.size
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

