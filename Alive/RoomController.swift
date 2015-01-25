//
//  RoomController.swift
//  Alive
//
//  Created by Cody R Fitzgerald on 12/22/14.
//  Copyright (c) 2014 Cody R Fitzgerald. All rights reserved.
//

import UIKit

class RoomController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var tView: UITableView!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var numPeople: UILabel!
    @IBOutlet weak var totalMins: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.hidden = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //CHANGE THIS TO RETURN THE USERS IN THE ROOM BASED ON WHAT IS PASSED IN
        return roomList.rooms.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        //CHANGE THIS TO RETURN THE USERS IN THE ROOM BASED ON WHAT IS PASSED IN
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Subtitle, reuseIdentifier: "test")
        
        cell.textLabel?.text = roomList.rooms[indexPath.row].name
        //cell.detailTextLabel?.text = roomList.rooms[indexPath.row].desc
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //GO TO USER?
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