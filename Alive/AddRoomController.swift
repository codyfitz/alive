//
//  AddRoomController.swift
//  alive
//
//  Created by Pete Kim on 3/18/15.
//  Copyright (c) 2015 Cody R Fitzgerald. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import UIKit

class AddRoomController: UIViewController {
    let charLimit = 50
    
    @IBOutlet weak var customBack: UIButton!
    
    @IBOutlet weak var roomNameTF: UITextField!
    
    @IBOutlet weak var charLeft: UILabel!
    
    @IBOutlet weak var createRoom: UIButton!
    
    @IBAction func customBackClicked(sender: UIButton!){
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
    
    @IBAction func createRoomClicked(sender: UIButton!){
        if countElements(self.roomNameTF.text) > self.charLimit {
            notifyError("50 characters max", self)
            return
        }
        
        let postRoomEndpoint:HTTPEndpoint! = HTTPEndpoint(method: .GET, route: "/room", encoding: .JSON, authenticate: true)
       
      
        /*
        postRoomEndpoint.request(
            //["room_name" : (self.roomNameTF.text)],
            sender: self,
            completionHandler: {
                (package:JSON!) -> Void in
                self.navigationController?.popToRootViewControllerAnimated(true)
        })*/
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
}
