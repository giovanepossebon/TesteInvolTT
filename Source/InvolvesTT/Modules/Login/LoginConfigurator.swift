//
//  LoginConfigurator.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 21/08/17.
//  Copyright (c) 2017 Rafael Leandro. All rights reserved.
//


import UIKit

class LoginModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? LoginViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: LoginViewController) {

        let router = LoginRouter()
        router.view = viewController

        let presenter = LoginPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = LoginInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
