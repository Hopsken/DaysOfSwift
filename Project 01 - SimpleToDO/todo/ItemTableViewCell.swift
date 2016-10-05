//
//  ItemTableViewCell.swift
//  todo
//
//  Created by shaowei on 2016/10/3.
//  Copyright © 2016年 shaowei. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {

    @IBOutlet weak var itemLable: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
