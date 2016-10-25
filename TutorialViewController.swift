//
//  TutorialViewController.swift
//  Carousel
//
//  Created by Alexander on 10/24/16.
//  Copyright © 2016 Alexander. All rights reserved.
//

import UIKit

class TutorialViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var pageControl: UIPageControl!
    
    @IBOutlet weak var carouselButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        carouselButton.alpha = 0
        
        scrollView.contentSize = CGSize(width: 1280, height: 570)
        scrollView.frame.size = CGSize(width: 320, height: 570)
        scrollView.delegate = self
        pageControl.currentPageIndicatorTintColor = UIColor.red

        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // This method is called as the user scrolls
        print("SCROLLING RIGHT AWAY!")
        
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView!) {
        // Get the current page based on the scroll offset
        let page : Int = Int(round(scrollView.contentOffset.x / 320))
        print("TEST Deceleration")
        // self.pageControl.currentPageIndicatorTintColor = UIColor.red
        
        // Set the current page, so the dots will update
        pageControl.currentPage = page
        pageControl.currentPageIndicatorTintColor = UIColor.red
        
        if page == 3 {
            pageControl.isHidden = true
            UIView.animate(withDuration: 0.7, animations: {
                self.carouselButton.alpha = 1
            })} else {
            carouselButton.alpha = 0
           // self.pageControl.isHidden = false
        }
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

