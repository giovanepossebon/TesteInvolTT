//
//  Tweet.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 28/08/17.
//  Copyright © 2017 Rafael Leandro. All rights reserved.
//

import UIKit

class Tweet: NSObject {
    
    var text: String?
    var screenName: String?
    var userName: String?
    
    static func convertFrom(json: JSON) -> Tweet {
        let tweet = Tweet()
        tweet.text = json["text"].string
        tweet.screenName = json["user"]["screen_name"].string
        tweet.text = json["text"].string
        return tweet
    }
    
}
