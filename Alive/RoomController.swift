//
//  RoomController.swift
//  Alive
//
//  Created by Cody R Fitzgerald on 12/22/14.
//  Copyright (c) 2014 Cody R Fitzgerald. All rights reserved.
//

import UIKit

class RoomController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var roomId: String = ""
    var socket: SocketIOClient?

    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var tView: UITableView!
    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var numPeople: UILabel!
    @IBOutlet weak var totalMins: UILabel!
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var roomName: UILabel!
    
    @IBAction func goBack(sender: AnyObject) {
        self.navigationController?.popToRootViewControllerAnimated(true)
        if let s = socket {
            s.emit("leave")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.navigationBar.hidden = false
        //self.navigationController?.navigationBar.barTintColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0)
        //var color = UIColor(hue: 0.76, saturation: 0.59, brightness: 0.50, alpha: 1)
        //var color = UIColor .whiteColor()
        //self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: color,
            //NSFontAttributeName: UIFont(name: "Calibri-Bold", size: 30)!]
        // Do any additional setup after loading the view.
        
        if let s = socket {
            println("setting up socket for room_id: \(self.roomId)")
            // user list
            s.on("user list", callback: { data, ack in
                println("user list received:")
                println("\(data)")
            })
           
            // guest id
            s.on("guest joined", callback: { data, ack in
                println("guest joined (guest id: \(data))")
            })
           
            // user object
            s.on("user joined", callback: { data, ack in
                println("user joined")
                println("\(data)")
            })
            
            // user object
            s.on("user left", callback: { data, ack in
                println("user left")
            })
           
            s.emit("join", ["room" : self.roomId])
        } else {
            println("socket error (nil)")
        }
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
