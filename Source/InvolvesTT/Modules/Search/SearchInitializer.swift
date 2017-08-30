//
//  SearchInitializer.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 28/08/17.
//  Copyright (c) 2017 Rafael Leandro. All rights reserved.
//

import UIKit

class SearchModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var SearchViewController: SearchViewController!

    override func awakeFromNib() {

        let configurator = SearchModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: SearchViewController)
    }

}
