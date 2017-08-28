//
//  FeedConfigurator.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 27/08/17.
//  Copyright (c) 2017 Rafael Leandro. All rights reserved.
//


import UIKit

class FeedModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? FeedViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: FeedViewController) {

        let router = FeedRouter()
        router.view = viewController

        let presenter = FeedPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = FeedInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
