//
//  SoketRequst.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/19.
//

import Foundation
import StompClientLib

//
//let url = NSURL(string: "ws://13.125.0.94:9093" + Api.creatChatroom.path())
//let intervalSec = 1.0
//public var soketClient = StompClientLib()
//
//func registerSocket(){
//    if(soketClient.isConnected()) {
//        soketClient.disconnect()
//        print("disconnect")
//    }
//    soketClient.openSocketWithURLRequest(request: NSURLRequest(url: url! as URL), delegate: soketClient.self as! StompClientLibDelegate)
//    func stompClientDidDisconnect(client: StompClientLib!) {
//        print("Socket is Disconnected")
//        
//    }
//    func stompClientDidConnect(client: StompClientLib!) {
//        print("Socket is connected")
//        
//    }
//
//    func serverDidSendReceipt(client: StompClientLib!, withReceiptId receiptId: String) { print("Receipt : \(receiptId)") }
//
//}
