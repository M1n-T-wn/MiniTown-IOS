//
//  ChatMyTableViewCell.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/27.
//

import UIKit
import QuartzCore

class ChatMyTableViewCell: UITableViewCell {

    @IBOutlet weak var RadiusView: UIView!
    @IBOutlet weak var chatMyTextView: UITextView!
    @IBOutlet weak var chatMyDate: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        RadiusView.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
