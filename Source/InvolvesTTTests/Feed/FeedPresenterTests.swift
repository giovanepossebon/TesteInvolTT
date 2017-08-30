//
//  FeedPresenterTests.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 28/08/17.
//  Copyright © 2017 Rafael Leandro. All rights reserved.
//

import XCTest
@testable import InvolvesTT

class FeedPresenterTests: XCTestCase {
    
    fileprivate var view: FeedViewControllerMock!
    fileprivate var interactor: FeedInteractorMock!
    
    
    override func setUp() {
        super.setUp()

        interactor = FeedInteractorMock()
        view = FeedViewControllerMock()
        
        continueAfterFailure = false
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoadUserFeed(){
        XCTAssertNotNil(self.interactor)
        self.interactor.loadTwitterFeed()
    }
    
    func presentTweets(response: [Tweet]){
        var tweets: [Feed.ViewModel] = []
        XCTAssertNotNil(response)
        for t in response{
            let tweet = Feed.ViewModel(name: t.screenName, text: t.text, user: t.userName)
            tweets.append(tweet)
        }
        XCTAssertNotNil(self.view)
        self.view.displayTweets(viewModels: tweets)
    }
    
    func presentError(msg: String){
        //self.view.displayError(error: msg)
    }
    
}


fileprivate class FeedInteractorMock: FeedInteractorInput{
    weak var output: FeedPresenterTests!
    
    func loadTwitterFeed(){
        
    }
}

fileprivate class FeedViewControllerMock: FeedViewInput{
    func displayError(error: String){
        
    }
    
    func displayTweets(viewModels: [Feed.ViewModel]){
        
    }
}
