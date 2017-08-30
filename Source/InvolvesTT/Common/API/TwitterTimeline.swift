//
//  TwitterTimeline.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 26/08/17.
//  Copyright © 2017 Rafael Leandro. All rights reserved.
//

import Foundation

extension InvolvesAPI{
    
    private func getTimeline(at path: String, parameters: Dictionary<String, Any>, count: Int? = nil, sinceID: String? = nil, maxID: String? = nil, trimUser: Bool? = nil, contributorDetails: Bool? = nil, includeEntities: Bool? = nil, success: SuccessHandler? = nil, failure: FailureHandler? = nil) {
        var params = parameters
        params["count"] ??= count
        params["since_id"] ??= sinceID
        params["max_id"] ??= maxID
        params["trim_user"] ??= trimUser
        params["contributor_details"] ??= contributorDetails
        params["include_entities"] ??= includeEntities
        
        self.getJSON(path: path, baseURL: .api, parameters: params, success: { json, _ in
            success?(json)
        }, failure: failure)
    }
    
    public func getHomeTimeline(count: Int? = nil, sinceID: String? = nil, maxID: String? = nil, trimUser: Bool? = nil, contributorDetails: Bool? = nil, includeEntities: Bool? = nil, success: SuccessHandler? = nil, failure: FailureHandler? = nil) {
        self.getTimeline(at: "statuses/home_timeline.json", parameters: [:], count: count, sinceID: sinceID, maxID: maxID, trimUser: trimUser, contributorDetails: contributorDetails, includeEntities: includeEntities, success: success, failure: failure)
    
    
    }
    
    
}
