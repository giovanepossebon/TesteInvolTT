//
//  FeedInitializer.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 27/08/17.
//  Copyright (c) 2017 Rafael Leandro. All rights reserved.
//

import UIKit

class FeedModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var FeedViewController: FeedViewController!

    override func awakeFromNib() {

        let configurator = FeedModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: FeedViewController)
    }

}
