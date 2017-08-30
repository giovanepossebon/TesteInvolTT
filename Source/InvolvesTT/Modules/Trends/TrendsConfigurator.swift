//
//  TrendsConfigurator.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 28/08/17.
//  Copyright (c) 2017 Rafael Leandro. All rights reserved.
//


import UIKit

class TrendsModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? TrendsViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: TrendsViewController) {

        let router = TrendsRouter()
        router.view = viewController

        let presenter = TrendsPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = TrendsInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
