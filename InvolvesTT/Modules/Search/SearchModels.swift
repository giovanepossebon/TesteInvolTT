//
//  SearchModels.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 28/08/17.
//  Copyright (c) 2017 Rafael Leandro. All rights reserved.
//

import UIKit

enum Search
{
    // MARK: Use cases
    
    struct Request
    {
        var key = ""
    }
    
    struct Response
    {
        
    }
    
    struct ViewModel
    {
        var name: String?
        var text: String?
        var user: String?
    }
    
}
