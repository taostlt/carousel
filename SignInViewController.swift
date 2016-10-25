//
//  SignInViewController.swift
//  Carousel
//
//  Created by Alexander on 10/23/16.
//  Copyright © 2016 Alexander. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController, UIScrollViewDelegate {
    
    @IBOutlet weak var buttonParentView: UIView!
    
    @IBOutlet weak var ScrollView: UIScrollView!
    
    @IBOutlet weak var emailText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    var buttonParentViewInitialY: CGFloat!
    var buttonParentViewOffset: CGFloat!
    
    let alertController = UIAlertController(title: "(Emptiness Abounds)", message: "Please Enter Your Login & Password", preferredStyle: .alert)
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ScrollView.contentSize = ScrollView.frame.size
        ScrollView.contentInset.bottom = 160
        
        self.buttonParentViewInitialY = self.buttonParentView.frame.origin.y
        self.buttonParentViewOffset = -100
        
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillShow, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            print("Keyboard will show!")
            self.buttonParentView.frame.origin.y = self.buttonParentViewInitialY + self.buttonParentViewOffset
            self.ScrollView.contentOffset.y = self.ScrollView.contentInset.bottom
        }
        
        NotificationCenter.default.addObserver(forName: Notification.Name.UIKeyboardWillHide, object: nil, queue: OperationQueue.main) { (notification: Notification) in
            print("KEYBOARD WILL HIDE")
            self.buttonParentView.frame.origin.y = self.buttonParentViewInitialY
            self.ScrollView.contentOffset.y = 0
        }
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func didTap(_ sender: AnyObject) {
        print("TAP ON THIS")
        view.endEditing(true)
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        // This method is called as the user scrolls
        print("SCROLLING RIGHT AWAY!")
    }
    
    @IBAction func pressSignIn(_ sender: AnyObject) {
        print("Sign In")
        
        // EMPTY EMPTY
        if emailText.text == "" && passwordText.text == ""{
            print("EMPTY EMPTY")
            self.activityIndicator.startAnimating()
            let secondsToDelay = 1.0
            
            let alertController = UIAlertController(title: "(Emptiness Abounds)", message: "Please Enter a Name and Password", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action:UIAlertAction) in
            })
            alertController.addAction(okAction)
            
            run(after: secondsToDelay, closure: {
                self.activityIndicator.stopAnimating()
                self.present(alertController, animated: true) {
                    // optional code for what happens after the alert controller has finished presenting
                }
            })
            
          // SUCCESS SUCESS
        } else if emailText.text == "Codepath Rocks!" && passwordText.text == "123"{
            print("SUCCESS SUCCESS")
            self.activityIndicator.startAnimating()
            
            self.performSegue(withIdentifier: "loginSegue", sender: nil
            )
            
//            let tutorialVC = self.storyboard?.instantiateViewController(withIdentifier: "TutorialVC")
//            self.present(tutorialVC!, animated: true, completion: nil)
            
        } // FAIL FAIL
          else {
            print("Login or Pwd is not correct")
            self.activityIndicator.startAnimating()
            let secondsToDelay = 1.0
            
            // Add Create and add Alert Controller:
            let alertController = UIAlertController(title: "ERROR TYPE 2043", message: "Please re-enter a Name and Password", preferredStyle: .alert)
            let failAction = UIAlertAction(title: "OK", style: .default, handler: { (action:UIAlertAction) in
            })
            alertController.addAction(failAction)
            
            // Stop Indicator and show Alert.
            run(after: secondsToDelay) {
                self.activityIndicator.stopAnimating()
                self.present(alertController, animated: true) {
                }
            }
        }
    }

func run(after wait: TimeInterval, closure: @escaping () -> Void) {
    let queue = DispatchQueue.main
    queue.asyncAfter(deadline: DispatchTime.now() + wait, execute: closure)
}

/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */

}
