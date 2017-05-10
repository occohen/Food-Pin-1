//
//  RestaurantTableViewCell.swift
//  Lesson 3
//
//  Created by Ori Cohen on 4/16/17.
//  Copyright © 2017 Ori Cohen. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
