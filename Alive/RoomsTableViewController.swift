//
//  RoomsTableViewController.swift
//  Alive
//
//  Created by Cody R Fitzgerald on 12/22/14.
//  Copyright (c) 2014 Cody R Fitzgerald. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import Starscream


class RoomsTableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    let baseURL = "http://localhost:8080"
    let webSocketHost = "localhost:8080"
    var rooms = [(String,String)]()
    var refreshControl:UIRefreshControl
    
    @IBOutlet weak var searchBar: UIImageView!
    
    @IBOutlet weak var searchField: UITextField!
    
    @IBOutlet weak var tView: UITableView!
    
    @IBOutlet weak var addButton: UIButton!
    
    @IBOutlet weak var settingsButton: UIButton!
    
    required init(coder aDecoder: NSCoder) {
        self.refreshControl = UIRefreshControl()
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.hidden = true
        var placeholder = NSAttributedString(string: "find your room", attributes: [NSForegroundColorAttributeName : UIColor(red: 0.219, green: 0.427, blue: 0.498, alpha: 1.0)])
        searchField.attributedPlaceholder = placeholder;
        
        self.getRooms()
        self.refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        self.refreshControl.addTarget(self, action: Selector("getRooms:"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /* TABLEVIEW PROTOCOL FUNCTIONS */
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rooms.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "test")
        let (name, id) = rooms[indexPath.row]
        cell.textLabel?.text = name
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //go to that particular room
        let cell: UITableViewCell = tableView.cellForRowAtIndexPath(indexPath)!
        cell.backgroundColor = UIColor(red: 1, green: 0.3529411, blue: 0.3529411, alpha: 1)
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.font = UIFont(name: "Calibri-Bold", size: 30)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        self.performSegueWithIdentifier("RoomListToRoom", sender: nil)
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor(red: 1, green: 0.3529411, blue: 0.3529411, alpha: 1)
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.font = UIFont(name: "Calibri-Bold", size: 30)
    }
    

    
    /* HELPER FUNCTIONS */
    
    func getRooms(){
        let getRooms = HTTPEndpoint(method: .GET, route: "/rooms",
            encoding: .URL, authenticate: true)
        
        getRooms.request([String:String](), sender: self, completionHandler: {
            (package) -> Void in
            for (index: String, subJson: JSON) in package["rooms"] {
                let name = "#"+subJson["name"].stringValue
                let id = subJson["_id"].stringValue
                self.rooms.append((name, id))
                self.tView.reloadData()
            }
        })
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
