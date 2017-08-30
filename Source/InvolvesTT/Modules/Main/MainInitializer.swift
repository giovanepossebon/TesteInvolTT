//
//  MainInitializer.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 27/08/17.
//  Copyright (c) 2017 Rafael Leandro. All rights reserved.
//

import UIKit

class MainModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var MainViewController: MainViewController!

    override func awakeFromNib() {

        let configurator = MainModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: MainViewController)
    }

}
