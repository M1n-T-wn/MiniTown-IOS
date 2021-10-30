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
    }
    let manager = SocketManager(socketURL: URL(string: soketBaseURL)!, config: [.log(true) , .compress, .connectParams(["Authorization": Token.accessToken!])])
    
    var socket : SocketIOClient!
    func establishConnection(){
        print("========connect=========")
        socket.connect()
    }
    func closeConnection(){
        socket.disconnect()
    }
    func joinRoom(chattingRoomId : String, chatCategory : String) {
        // MEETING, PLACE, GOODS
        
    }
    
}
