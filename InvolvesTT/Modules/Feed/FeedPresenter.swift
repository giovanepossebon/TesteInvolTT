//
//  FeedPresenter.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 27/08/17.
//  Copyright (c) 2017 Rafael Leandro. All rights reserved.
//

import UIKit

protocol FeedModuleInput: class {

}

class FeedPresenter: FeedModuleInput, FeedViewOutput, FeedInteractorOutput {
    weak var view: FeedViewInput!
    var interactor: FeedInteractorInput!
    var router: FeedRouterInput!
    
    func loadUserFeed(){
        self.interactor.loadTwitterFeed()
    }

    func presentTweets(response: [Tweet]){
        var tweets: [Feed.ViewModel] = []
        for t in response{
            let tweet = Feed.ViewModel(name: t.screenName, text: t.text, user: t.userName)
            tweets.append(tweet)
        }
        self.view.displayTweets(viewModels: tweets)
    }
    
    func presentError(msg: String){
        self.view.displayError(error: msg)
    }
    
}
