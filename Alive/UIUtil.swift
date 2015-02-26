//
//  UIUtil.swift
//  alive
//
//  Created by Pete Kim on 2/25/15.
//  Copyright (c) 2015 Cody R Fitzgerald. All rights reserved.
//

import UIKit
import Foundation

func notifyError(message:String!, controller: UIViewController!) {
    var alert:UIAlertController = UIAlertController(title: "Error", message: message, preferredStyle: .Alert)
    let cancelAction: UIAlertAction! = UIAlertAction(title: "cancel", style: .Cancel, handler:nil)
        alert.addAction(cancelAction)
        controller.presentViewController(alert, animated: true, completion: nil)
}
