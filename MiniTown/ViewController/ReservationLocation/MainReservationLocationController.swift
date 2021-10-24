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
      
    }
    @IBAction func connect(_ sender: Any) {
        SocketIOManager.sharedInstance.establishConnection()
    }
}
