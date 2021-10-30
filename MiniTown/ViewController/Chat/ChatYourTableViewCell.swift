//
//  ChatYourTableViewCell.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/27.
//

import UIKit
import QuartzCore

class ChatYourTableViewCell: UITableViewCell {

    @IBOutlet weak var RadiusView: UIView!
    
    @IBOutlet weak var yourProfileImage: UIImageView!
    @IBOutlet weak var yourProfileNameLabel: UILabel!
    
    @IBOutlet weak var chatYourTextView: UITextView!
    @IBOutlet weak var chatYourDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        yourProfileImage.layer.cornerRadius = yourProfileImage.frame.height/2
        RadiusView.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
