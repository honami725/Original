//
//  TableViewCell.swift
//  Original
//
//  Created by Honami on 2016/03/02.
//  Copyright © 2016年 Honami. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet var myTweetLabel : UILabel!
    @IBOutlet var myWeightLabel : UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
