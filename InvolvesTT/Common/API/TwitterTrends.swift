//
//  TwitterTrends.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 26/08/17.
//  Copyright © 2017 Rafael Leandro. All rights reserved.
//

import UIKit

extension InvolvesAPI {
    
    public func getTrendsPlace(with woeid: String, excludeHashtags: Bool = false, success: SuccessHandler? = nil, failure: FailureHandler? = nil) {
        let path = "trends/place.json"
        
        var parameters = Dictionary<String, Any>()
        parameters["id"] = woeid // WOEID is a Yahoo! Where On Earth ID: http://woeid.rosselliot.co.nz
        parameters["exclude"] = excludeHashtags ? "hashtags" : nil
        
        self.getJSON(path: path, baseURL: .api, parameters: parameters, success: { json, _ in success?(json) }, failure: failure)
    }
    
    
}
