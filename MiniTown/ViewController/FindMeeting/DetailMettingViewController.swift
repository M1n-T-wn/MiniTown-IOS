//
//  DetailMettingViewController.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/25.
//

import UIKit
import QuartzCore

class DetailMettingViewController: UIViewController {
    
    var mettingTitleLable : String?
    var mettingLocationLable : String?
    var mettingInfoLable : String?
    var mettingChatNessage : String?
    var mettingImage : String?
    
    @IBOutlet weak var MainMaskView: UIView!
    
    @IBOutlet weak var MainImage: UIImageView!
    
    @IBOutlet weak var TitleLAbel: UILabel!
    @IBOutlet weak var LocationLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        self.navigationController?.navigationBar.titleTextAttributes =
        [.foregroundColor: UIColor.white]
        TitleLAbel.text = mettingTitleLable
        LocationLabel.text = "2021. 10. 14 12:23"
        MainImage.image = (UIImage(named: mettingImage ?? "프로필"))
        MainMaskView.layer.shadowColor = UIColor.gray.cgColor
        MainMaskView.layer.shadowOffset = CGSize(width: 0, height: 10)
        MainMaskView.layer.shadowRadius = 8
        MainMaskView.layer.shadowOpacity = 0.5
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func bavkButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
}
