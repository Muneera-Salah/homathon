//
//  DataTableViewCell.swift
//  BookACart
//
//  Created by Nouf Aldoaij on 23/04/2020.
//  Copyright © 2020 Nouf Aldoaij. All rights reserved.
//

import UIKit

class DataTableViewCell: UITableViewCell {

    @IBOutlet var customerCountLabel: UILabel!
    @IBOutlet var timeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
