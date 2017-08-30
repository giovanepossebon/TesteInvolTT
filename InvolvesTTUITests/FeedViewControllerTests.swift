//
//  FeedViewControllerTests.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 29/08/17.
//  Copyright © 2017 Rafael Leandro. All rights reserved.
//

import XCTest
@testable import InvolvesTT

class FeedViewControllerTests: XCTestCase, FeedViewInput {
        
    override func setUp() {
        super.setUp()
        
        guard let sut = getViewController() else { return }
        _ = sut.view
        
        XCTAssertNotNil(sut.output, "Presenter nao carregado")
        
        continueAfterFailure = false
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func getViewController() -> FeedViewController?{
        let vc = FeedViewController(nibName: "FeedViewController", bundle: nil)
        XCTAssertNotNil(vc)
        return vc
    }
    
    func displayError(error: String){
        
    }
    
    func displayTweets(viewModels: [Feed.ViewModel]){
        
    }
    
}
