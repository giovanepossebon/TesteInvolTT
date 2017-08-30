//
//  TrendsPresenter.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 28/08/17.
//  Copyright (c) 2017 Rafael Leandro. All rights reserved.
//

import UIKit

protocol TrendsModuleInput: class {

}

class TrendsPresenter: TrendsModuleInput, TrendsViewOutput, TrendsInteractorOutput {
    weak var view: TrendsViewInput!
    var interactor: TrendsInteractorInput!
    var router: TrendsRouterInput!

    
    func loadTrends(request: Trends.Request) {
        interactor.loadTrends(request: request)
    }
    
    func presentTweets(response: [TTrends]){
        var tweets: [Trends.ViewModel] = []
        for t in response{
            let trend = Trends.ViewModel(name: t.name, url: t.url)
            tweets.append(trend)
        }
        self.view.displayTweets(viewModels: tweets)
    }
    
    func presentError(msg: String){
        self.view.displayError(error: msg)
    }
    
    
}
