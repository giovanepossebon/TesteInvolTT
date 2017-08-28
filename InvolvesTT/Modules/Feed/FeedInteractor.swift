//
//  FeedInteractor.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 27/08/17.
//  Copyright (c) 2017 Rafael Leandro. All rights reserved.
//

import UIKit

protocol FeedInteractorInput {
    func loadTwitterFeed()
}

protocol FeedInteractorOutput: class {
    func presentTweets(response: [Tweet])
    func presentError(msg: String)
}

class FeedInteractor: FeedInteractorInput
{
    weak var output: FeedInteractorOutput!


    func loadTwitterFeed(){
        InvolvesAPI.instance.getHomeTimeline(success: { (response) in
            if let array = response.array{
                var tweets: [Tweet] = []
                for t in array{
                    let tweet = Tweet.convertFrom(json: t)
                    tweets.append(tweet)
                }
                self.output.presentTweets(response: tweets)
            }
        }) { (error) in
            self.output.presentError(msg: error.localizedDescription)
        }
        
    }
    
}
