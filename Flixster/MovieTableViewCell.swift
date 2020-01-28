//
//  MovieTableViewCell.swift
//  Flixster
//
//  Created by Samuel Elbaz on 1/28/20.
//  Copyright © 2020 Samuel Elbaz. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!

    @IBOutlet weak var posterView: UIImageView!
        

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
