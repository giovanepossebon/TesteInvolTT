//
//  SearchConfigurator.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 28/08/17.
//  Copyright (c) 2017 Rafael Leandro. All rights reserved.
//


import UIKit

class SearchModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? SearchViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: SearchViewController) {

        let router = SearchRouter()
        router.view = viewController

        let presenter = SearchPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = SearchInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
