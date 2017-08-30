//
//  LoginInitializer.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 21/08/17.
//  Copyright (c) 2017 Rafael Leandro. All rights reserved.
//

import UIKit

class LoginModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var LoginViewController: LoginViewController!

    override func awakeFromNib() {

        let configurator = LoginModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: LoginViewController)
    }

}
