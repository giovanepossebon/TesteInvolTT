//
//  SearchPresenter.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 28/08/17.
//  Copyright (c) 2017 Rafael Leandro. All rights reserved.
//

import UIKit

protocol SearchModuleInput: class {

}

class SearchPresenter: SearchModuleInput, SearchViewOutput, SearchInteractorOutput {
    weak var view: SearchViewInput!
    var interactor: SearchInteractorInput!
    var router: SearchRouterInput!

    
    func search(request: Search.Request){
        interactor.search(request: request)
    }
    
    func presentError(msg: String){
        view.displayError(error: msg)
    }
    
    func presentResults(response: [Tweet]){
        var tweets: [Search.ViewModel] = []
        for t in response{
            let tweet = Search.ViewModel(name: t.screenName, text: t.text, user: t.userName)
            tweets.append(tweet)
        }
       self.view.displayResults(viewModel: tweets)
    }
    
}
