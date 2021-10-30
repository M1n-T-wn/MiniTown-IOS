//
//  RentalItemsDetailViewController.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/30.
//

import UIKit
import QuartzCore

class RentalItemsDetailViewController: UIViewController {
    
    @IBOutlet weak var MainImage: UIImageView!
    @IBOutlet weak var userIdProfileImage: UIImageView!
    
    @IBOutlet weak var userIdlabel: UILabel!
    @IBOutlet weak var postLocationLabel: UILabel!
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var infoTextview: UITextView!
    
    @IBOutlet weak var MainMaskView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userIdProfileImage.layer.cornerRadius = userIdProfileImage.frame.height/2
        MainMaskView.layer.shadowColor = UIColor.gray.cgColor
        MainMaskView.layer.shadowOffset = CGSize(width: 0, height: 10)
        MainMaskView.layer.shadowRadius = 8
        MainMaskView.layer.shadowOpacity = 0.5
        // Do any additional setup after loading the view.
    }
    
    @IBAction func okPressButton(_ sender: Any) {
        
        
    }
    @IBAction func backButton(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)   
    }
    
}
