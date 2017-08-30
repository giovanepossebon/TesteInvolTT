//
//  TweetCell.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 28/08/17.
//  Copyright © 2017 Rafael Leandro. All rights reserved.
//

import UIKit

class TweetCell: UITableViewCell {

    @IBOutlet weak private var userImageView: UIImageView!
    @IBOutlet weak private var userNameLabel: UILabel!
    @IBOutlet weak private var tweetTextLabel: UILabel!
    
    var userPicture: UIImage?{
        didSet{
            userImageView.image = userPicture
        }
    }
    
    var userName: String?{
        didSet{
            userNameLabel.text = userName
        }
    }
    
    var tweetText: String?{
        didSet{
            tweetTextLabel.text = tweetText
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
