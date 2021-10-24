//
//  ChatroomListTableViewCell.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/25.
//

import UIKit
import QuartzCore

class ChatroomListTableViewCell: UITableViewCell {

    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var chatMessageLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        titleImage.layer.cornerRadius = titleImage.frame.height/2
        titleImage.layer.borderWidth = 1
        titleImage.layer.borderColor = UIColor.clear.cgColor
        titleImage.clipsToBounds = true
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
