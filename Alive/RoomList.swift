//
//  RoomList.swift
//  Alive
//
//  Created by Cody R Fitzgerald on 12/21/14.
//  Copyright (c) 2014 Cody R Fitzgerald. All rights reserved.
//

import UIKit

var roomList: RoomList = RoomList()

struct user {
    var username = "@"
    var activeRoom = "none"
}

struct room {
    var name = "#un-named"
    var p_count = 0
    var users = [user]()
}


class RoomList: NSObject {
    var rooms = [room]()
    
    func addRoom(name: String, p_count: Int, users: [user]) {
        rooms.append(room(name: name, p_count: p_count, users: users))
    }

}
