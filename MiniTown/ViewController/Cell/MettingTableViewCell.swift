//
//  MettingTableViewCell.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/23.
//

import UIKit
import QuartzCore

class MettingTableViewCell: UITableViewCell {

    @IBOutlet weak var titleTextLable: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var infoLabel: UILabel!
    
    @IBOutlet weak var MainImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        MainImage.layer.cornerRadius = 10
        MainImage.layer.borderWidth = 1
        MainImage.layer.borderColor = UIColor.clear.cgColor
        MainImage.clipsToBounds = true
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
