//
//  RemtItemsListTableViewCell.swift
//  MiniTown
//
//  Created by 김대희 on 2021/10/30.
//

import UIKit
import QuartzCore

class RemtItemsListTableViewCell: UITableViewCell {

    @IBOutlet weak var ItemMainImage: UIImageView!
    @IBOutlet weak var TitleLabel: UILabel!
    @IBOutlet weak var DateLabel: UILabel!
    @IBOutlet weak var CostLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        ItemMainImage.layer.cornerRadius = 10
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
