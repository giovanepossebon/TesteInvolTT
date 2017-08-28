//
//  TrendsTableViewCell.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 28/08/17.
//  Copyright © 2017 Rafael Leandro. All rights reserved.
//

import UIKit

class TrendsTableViewCell: UITableViewCell {

    @IBOutlet weak private var positionLabel: UILabel!
    @IBOutlet weak private var nameLabel: UILabel!
    
    var position: Int?{
        didSet{
            positionLabel.text = "\(position ?? 0))"
        }
    }
    
    var trend: String?{
        didSet{
            nameLabel.text = trend
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
