//
//  AddController.swift
//  Alive
//
//  Created by Cody R Fitzgerald on 12/22/14.
//  Copyright (c) 2014 Cody R Fitzgerald. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class AddController: UIViewController {

    let charLimit = 50
    
    @IBOutlet weak var customBack: UIButton!
    
    @IBOutlet weak var roomNameTF: UITextField!
    
    @IBOutlet weak var charLeft: UILabel!
    
    @IBOutlet weak var createRoom: UIButton!
    
    
    @IBAction func createRoomClicked(sender: UIButton!) {
        // check char limit
        if self.charLimit < countElements(self.roomNameTF.text) {
            notifyError("\(self.charLimit) character limit", self)
            return
        }
        
        // make request to post /room
        let postRoom = HTTPEndpoint(method: .POST, route: "/room", encoding: .JSON, authenticate: true)
       
        var parameters = [String:String]()
        parameters["room_name"] = self.roomNameTF.text
        
        postRoom.request(parameters,
            sender: self,
            completionHandler: {
                (package: JSON!) -> Void in
            self.presentingViewController?.dismissViewControllerAnimated(true, completion: nil)
            }
        )
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.navigationBar.hidden = false
        //self.navigationController?.navigationBar.barTintColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0)
        //var color = UIColor(hue: 0.53888, saturation: 0.59, brightness: 0.50, alpha: 1)
        //self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: color,
            //NSFontAttributeName: UIFont(name: "Calibri-Bold", size: 24)!]
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func customBack(sender: UIButton) {
        self.navigationController?.popToRootViewControllerAnimated(true)
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
