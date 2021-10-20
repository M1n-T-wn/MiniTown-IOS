//
//  HomeViewControiier.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/18.
//

import UIKit
import QuartzCore

class HomeViewController: UIViewController {
    
    @IBOutlet weak var homeProfileImage: UIImageView!
    @IBOutlet weak var mainInfoLabel: UILabel!
    @IBOutlet weak var subInfoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = backBarButtonItem
        homeProfileImage.layer.cornerRadius = homeProfileImage.frame.height/2
        homeProfileImage.layer.borderWidth = 1
        homeProfileImage.layer.borderColor = UIColor.clear.cgColor
        homeProfileImage.clipsToBounds = true
        
        
    }
    @IBAction func findMettingButton(_ sender: Any) {
        
    }
    
    @IBAction func reservationLocationButton(_ sender: Any) {
    }
    
    @IBAction func rentalItemsButton(_ sender: Any) {
    }
    
    @IBAction func settengsButton(_ sender: Any) {
    }
    
}
