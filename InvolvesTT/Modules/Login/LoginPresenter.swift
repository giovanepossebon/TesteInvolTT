//
//  LoginPresenter.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 21/08/17.
//  Copyright (c) 2017 Rafael Leandro. All rights reserved.
//

import UIKit

protocol LoginModuleInput: class {
   
}

class LoginPresenter: LoginModuleInput, LoginViewOutput, LoginInteractorOutput {
    weak var view: LoginViewInput!
    var interactor: LoginInteractorInput!
    var router: LoginRouterInput!

    
    func login(){
        if let callbackView = view as? UIViewController{
            interactor.loginWithTwitter(view: callbackView)
        }
    }
    
    func didLogin(){
        router.navigateToMain()
    }
    
    func presentError(msg: String) {
        view.displayError(error: msg)
    }
    
}
