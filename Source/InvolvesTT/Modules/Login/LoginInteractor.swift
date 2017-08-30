//
//  LoginInteractor.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 21/08/17.
//  Copyright (c) 2017 Rafael Leandro. All rights reserved.
//

import UIKit

protocol LoginInteractorInput {
    func loginWithTwitter(view: UIViewController)
}

protocol LoginInteractorOutput: class {
    func didLogin()
    func presentError(msg: String)
}

class LoginInteractor: LoginInteractorInput
{
    weak var output: LoginInteractorOutput!
    
    
    func loginWithTwitter(view: UIViewController) {
        //let apiA = InvolvesAPI(consumerKey: "QbL0ts0VIaaQuQmWDFVDUw", consumerSecret: "dKVt1NjVULFOuI4RAd3MQGrVoquUPjC8eCtW3qpw3g")
        let callback = URL(string: "involvestt://success")!
        let failureHandler: (Error) -> Void = { error in
            self.output.presentError(msg: error.localizedDescription)
        }
        
        InvolvesAPI.instance.authorize(with: callback, presentFrom: view, success: { accessToken, response in
            self.output.didLogin()
        }, failure: failureHandler)
    }
    
}
