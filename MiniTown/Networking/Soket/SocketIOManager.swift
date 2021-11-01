//
//  SocketIOManager.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/24.
//

import Foundation
import SocketIO
class SocketIOManager: NSObject {
    
    static let sharedInstance = SocketIOManager()
    
    static let shared = SocketIOManager()
    override init() {
        super.init()
        socket = self.manager.socket(forNamespace: "/")
        debugPrint(" ===== socket connected=====")
    }
    let manager = SocketManager(socketURL: URL(string: soketBaseURL)!, config: [.log(true) , .compress, .connectParams(["Authorization": Token.accessToken!])])
    
    
    var socket : SocketIOClient!
    func establishConnection(){
        print("========connect=========")
        socket.connect()
        
        socket.on("info") { data, ack in
            print (data)
        }
        socket.on("message") { data, ack in
            print (data)
        }
        
        let message : [String : Any] = [
            "chattingRoomId" : "4f876809-1295-474f-8a9b-7fbaaa5ae40d",
            "chatCategory" : "GOODS"
        ]
        socket.emit("", message)
        
        
    }
    func closeConnection(){
        socket.disconnect()
        
        
    }
    func sendMessage(message1 : String) {
        let message : [String : Any] = [
            "chattingRoomId" : "4f876809-1295-474f-8a9b-7fbaaa5ae40d",
            "message": message1
        ]
        socket.emit("", message)
        //        socket.connect()
    }
    func joinRoom(chattingRoomId : String, chatCategory : String) {
        // MEETING, PLACE, GOODS
    }
    
}
