//
//  TrendsInitializer.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 28/08/17.
//  Copyright (c) 2017 Rafael Leandro. All rights reserved.
//

import UIKit

class TrendsModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var TrendsViewController: TrendsViewController!

    override func awakeFromNib() {

        let configurator = TrendsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: TrendsViewController)
    }

}
