//
//  TwitterSearch.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 26/08/17.
//  Copyright © 2017 Rafael Leandro. All rights reserved.
//

import Foundation

extension InvolvesAPI{
    
    public func searchTweet(using query: String, geocode: String? = nil, lang: String? = nil, locale: String? = nil, resultType: String? = nil, count: Int? = nil, until: String? = nil, sinceID: String? = nil, maxID: String? = nil, includeEntities: Bool? = nil, callback: String? = nil, success: ((JSON, _ searchMetadata: JSON) -> Void)? = nil, failure: @escaping FailureHandler) {
        let path = "search/tweets.json"
        
        var parameters = Dictionary<String, Any>()
        parameters["q"] = query
        parameters["geocode"] ??= geocode
        parameters["lang"] ??= lang
        parameters["locale"] ??= locale
        parameters["result_type"] ??= resultType
        parameters["count"] ??= count
        parameters["until"] ??= until
        parameters["since_id"] ??= sinceID
        parameters["max_id"] ??= maxID
        parameters["include_entities"] ??= includeEntities
        parameters["callback"] ??= callback
        
        self.getJSON(path: path, baseURL: .api, parameters: parameters, success: { json, _ in
            success?(json["statuses"], json["search_metadata"])
        }, failure: failure)
    }
    
}
