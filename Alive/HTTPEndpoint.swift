//
//  HTTPEndpoint.swift
//  alive
//
//  Created by Pete Kim on 2/25/15.
//  Copyright (c) 2015 Cody R Fitzgerald. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON


public class HTTPEndpoint {
   
    let baseURL = "http://localhost:8080"
    let method: Alamofire.Method
    let route: String
    let encoding: ParameterEncoding
    let authenticate: Bool
    
    init(method: Alamofire.Method!, route: String!, encoding: ParameterEncoding!, authenticate: Bool!){
        self.method = method
        self.route = route
        self.encoding = encoding
        self.authenticate = authenticate
    }
    
    func request( var parameters: Dictionary<String, String>,
        sender: UIViewController,
        completionHandler: ((package:JSON!) -> Void)?){
        
        let userDefault: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let access_token: String? = userDefault.objectForKey("access_token") as String?
        
        if self.authenticate == true {
            if let a = access_token {
                parameters["access_token"] = access_token
            } else {
                notifyError("Login required", sender)
                // TODO force logout
                return
            }
        }
        
        Alamofire.request(self.method, baseURL + self.route,
            parameters: parameters,
            encoding: self.encoding).responseJSON({
                (req, res, json, err) in
                
                // sys errors (prefers HTTP error codes over ios ones)
                if let e = err as NSError?{
                    if let r = res as NSHTTPURLResponse?{
                        if r.statusCode != 200{
                            notifyError(
                                NSHTTPURLResponse.localizedStringForStatusCode(r.statusCode),sender)
                        }
                    } else {
                        notifyError(e.localizedDescription, sender)
                    }
                    return
                }
                
                let parsedJSON: JSON! = JSON(json!)
                
                if parsedJSON["success"] == true {
                    if let c = completionHandler {
                        c(package: parsedJSON["package"])
                    }
                } else {
                    let errorMessage: String! = parsedJSON["message"].string
                    notifyError(errorMessage, sender)
                }
            })
        
    }


}