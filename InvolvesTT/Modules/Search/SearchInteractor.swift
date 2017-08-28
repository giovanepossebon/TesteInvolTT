//
//  SearchInteractor.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 28/08/17.
//  Copyright (c) 2017 Rafael Leandro. All rights reserved.
//

import UIKit

protocol SearchInteractorInput {
    func search(request: Search.Request)
}

protocol SearchInteractorOutput: class {
    func presentError(msg: String)
    func presentResults(response: [Tweet])
}

class SearchInteractor: SearchInteractorInput
{
    weak var output: SearchInteractorOutput!
    
    func search(request: Search.Request){
        InvolvesAPI.instance.searchTweet(using: request.key, success: { (response, data) in
            if let array = response.array{
                var tweets: [Tweet] = []
                for t in array{
                    let tweet = Tweet.convertFrom(json: t)
                    tweets.append(tweet)
                }
                self.output.presentResults(response: tweets)
            }
        }) { (error) in
            self.output.presentError(msg: error.localizedDescription)
        }
    }
    
}
