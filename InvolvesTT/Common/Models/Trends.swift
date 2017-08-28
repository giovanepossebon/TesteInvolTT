//
//  Trends.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 28/08/17.
//  Copyright © 2017 Rafael Leandro. All rights reserved.
//

import UIKit

class TTrends: NSObject {

    var name: String?
    var url: URL?
    
    static func convertFrom(json: JSON) -> [TTrends] {
        var trends = [TTrends]()
        if let array = json["trends"].array{
            for t in array{
                let topic = TTrends()
                topic.name = t["name"].string
                if let urlStr = t["url"].string{
                    topic.url = URL(string: urlStr)
                }
                trends.append(topic)
            }
        }
        return trends
    }
    
    
}
