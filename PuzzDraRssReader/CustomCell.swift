//
//  CustomCell.swift
//  PuzzDraRssReader
//
//  Created by 武田祐一郎 on 2016/11/13.
//  Copyright © 2016年 Yuichiro-Takeda. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var contents: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
