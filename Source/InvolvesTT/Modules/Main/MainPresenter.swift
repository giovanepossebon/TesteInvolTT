//
//  MainPresenter.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 27/08/17.
//  Copyright (c) 2017 Rafael Leandro. All rights reserved.
//

import UIKit

protocol MainModuleInput: class {

}

class MainPresenter: MainModuleInput, MainViewOutput, MainInteractorOutput {
    weak var view: MainViewInput!
    var interactor: MainInteractorInput!
    var router: MainRouterInput!

}
