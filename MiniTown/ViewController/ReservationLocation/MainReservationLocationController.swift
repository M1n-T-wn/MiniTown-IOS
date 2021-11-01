//
//  MainReservationLocationController.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/19.
//

import UIKit
import SocketIO

class MainReservationLocationController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Connection with socket
        SocketIOManager.sharedInstance.establishConnection()
      
    }
    @IBAction func connect(_ sender: Any) {
        SocketIOManager.sharedInstance.sendMessage(message1: "제발 한번만")
        
    }
}
