//
//  TouristCell.swift
//  TouristApp
//
//  Created by 许畅 on 2022/10/3.
//

import UIKit

class TouristCell: UITableViewCell {

    @IBOutlet weak var imgTourist: UIImageView!
    @IBOutlet weak var lblTourist: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
