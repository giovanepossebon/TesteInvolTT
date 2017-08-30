//
//  FeedConfiguratorTests.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 29/08/17.
//  Copyright © 2017 Rafael Leandro. All rights reserved.
//

import XCTest

class FeedConfiguratorTests: XCTestCase {
        
    override func setUp() {
        super.setUp()

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = true
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testConfigureModuleForViewInput<UIViewController>(viewInput: UIViewController) {
        //given
        let viewController = FeedViewControllerMock()
        let configurator = FeedModuleConfigurator()
        
        //when
        configurator.configureModuleForViewInput(viewInput: viewController)
        
        //then
        XCTAssertNotNil(viewController.output, "{{ module_info.name }}ViewController is nil after configuration")
        XCTAssertTrue(viewController.output is FeedPresenter, "output is not {{ module_info.name }}Presenter")
        
        let presenter: FeedPresenter = viewController.output as! FeedPresenter
        XCTAssertNotNil(presenter.view, "view in Presenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in Presenter is nil after configuration")
        XCTAssertTrue(presenter.router is FeedRouter, "router is not {{ module_info.name }}Router")
        
        let interactor: FeedInteractor = presenter.interactor as! FeedInteractor
        XCTAssertNotNil(interactor.output, "output in Interactor is nil after configuration")
        
    }
    
}

fileprivate class FeedViewControllerMock: FeedViewController {
    
    var setupInitialStateDidCall = false
    
    func setupInitialState() {
        setupInitialStateDidCall = true
    }
}
