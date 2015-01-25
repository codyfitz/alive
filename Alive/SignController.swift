//
//  LoginController.swift
//  Alive
//
//  Created by Cody R Fitzgerald on 12/22/14.
//  Copyright (c) 2014 Cody R Fitzgerald. All rights reserved.
//

import UIKit

class SignController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var loginBottomConstraint: NSLayoutConstraint!

    @IBOutlet weak var userNameTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!

    @IBOutlet weak var graySpace: UIImageView!
    
    @IBAction func loginVerify(sender: UIButton) {
        var usr = ""
        var pw = ""
        if userNameTextField.text == usr && passwordTextField.text == pw {
            self.performSegueWithIdentifier("LoginToRooms", sender: nil)
            userNameTextField.resignFirstResponder()
            passwordTextField.resignFirstResponder()
        }
        else {
            userNameTextField.resignFirstResponder()
            passwordTextField.resignFirstResponder()
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardFrameDidChange:"), name:UIKeyboardDidChangeFrameNotification, object: nil)
        self.navigationController?.navigationBar.hidden = false
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0)
        var color = UIColor(hue: 0.53888, saturation: 0.59, brightness: 0.50, alpha: 1)
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: color,
            NSFontAttributeName: UIFont(name: "Calibri-Bold", size: 24)!]
        passwordTextField.borderStyle = UITextBorderStyle.None
        userNameTextField.borderStyle = UITextBorderStyle.None
        userNameTextField.delegate = self
        passwordTextField.delegate = self
        //self.navigationController?.navigationBar.shadowImage = UIImage()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)

    }
    
    func keyboardFrameDidChange(notification: NSNotification){
        var info = notification.userInfo!
        var keyboardFrame: CGRect = (info[UIKeyboardFrameEndUserInfoKey] as NSValue).CGRectValue()
        self.view.layoutIfNeeded()
        
        UIView.animateWithDuration(1.0, delay: 0, options: nil, animations: {
            self.loginButton.frame = CGRectMake(self.loginButton.frame.origin.x, keyboardFrame.origin.y - self.loginButton.frame.size.height, self.loginButton.frame.size.width, self.loginButton.frame.size.height)
            
            }, completion: { finished in
                self.loginBottomConstraint.constant = -(keyboardFrame.size.height)
                self.view.layoutIfNeeded()
        })
    }
    
//    func textFieldDidBeginEditing(textField: UITextField) {
//        var y = loginButton.center.y
//        UIView.animateWithDuration(1.0, animations: {
//            self.loginButton.center=CGPointMake(self.loginButton.center.x, y - 100)
//            //self.graySpace.frame = CGRectMake(self.graySpace.frame.origin.x, self.graySpace.frame.origin.y, self.graySpace.frame.width, (self.graySpace.frame.height + 100))
//            }, completion: { animationFinished in
//                //self.loginButton.center=CGPointMake(self.loginButton.center.x, y + 100)
//                //self.graySpace.frame = CGRectMake(self.graySpace.frame.origin.x, self.graySpace.frame.origin.y, self.graySpace.frame.width, (self.graySpace.frame.height + 100))
//                
//            })
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
