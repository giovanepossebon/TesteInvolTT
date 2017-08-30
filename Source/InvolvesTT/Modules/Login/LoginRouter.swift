//
//  LoginRouter.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 21/08/17.
//  Copyright (c) 2017 Rafael Leandro. All rights reserved.
//

import UIKit


protocol LoginRouterInput {
    func navigateToMain()
}

class LoginRouter: LoginRouterInput
{
    weak var view: UIViewController?

    
    func navigateToMain(){
        let main = MainViewController(nibName: "MainViewController", bundle: nil)
        if let navigation = view?.navigationController{
            navigation.pushViewController(main, animated: true)
        }
    }
    
}
