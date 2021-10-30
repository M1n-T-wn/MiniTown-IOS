//
//  DetailMettingViewController.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/25.
//

import UIKit
import QuartzCore

class DetailMettingViewController: UIViewController {
    
    var detailIndex : Int = 0

    @IBOutlet weak var MainImage: UIImageView!
    
    @IBOutlet weak var nettingNameLabel: UILabel!
    @IBOutlet weak var mettingPeopleLabel: UILabel!
    
    @IBOutlet weak var mettingAgeLabel: UILabel!
    @IBOutlet weak var mettingDayLabel: UILabel!
    
    @IBOutlet weak var mettingInfoLabel: UITextView!
    @IBOutlet weak var MettingTimeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        
        self.navigationController?.navigationBar.titleTextAttributes =
        [.foregroundColor: UIColor.white]
        nettingNameLabel.text = chattingRoom[detailIndex].name
        mettingPeopleLabel.text = chattingRoom[detailIndex].onOffline
        MainImage.image = (UIImage(named: chattingRoom[detailIndex].Image ?? "프로필"))
        mettingInfoLabel.text = chattingRoom[detailIndex].info
        mettingInfoLabel.isEditable = false
        MainImage.layer.shadowColor = UIColor.gray.cgColor
        MainImage.layer.shadowOffset = CGSize(width: 0, height: 10)
        MainImage.layer.shadowRadius = 8
        MainImage.layer.shadowOpacity = 0.5
        // Do any additional setup after loading the view.
    }
    
    @IBAction func okpressButton(_ sender: Any) {
    }
    
    @IBAction func bavkButton(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
}
