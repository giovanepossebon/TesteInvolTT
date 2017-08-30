//
//  TrendsInteractor.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 28/08/17.
//  Copyright (c) 2017 Rafael Leandro. All rights reserved.
//

import UIKit

protocol TrendsInteractorInput {
    func loadTrends(request: Trends.Request)
}

protocol TrendsInteractorOutput: class {
    func presentTweets(response: [TTrends])
    func presentError(msg: String)
}

class TrendsInteractor: TrendsInteractorInput
{
    weak var output: TrendsInteractorOutput!

    
    func loadTrends(request: Trends.Request){
        InvolvesAPI.instance.getTrendsPlace(with: request.woeid, success: { (response) in
            if let array = response.array{
                var trends: [TTrends] = []
                for t in array{
                    //let trend = TTrends.convertFrom(json: t)
                    //trends.append(trend)
                    trends = TTrends.convertFrom(json: t)
                }
                self.output.presentTweets(response: trends)
            }
        }) { (error) in
            self.output.presentError(msg: error.localizedDescription)
        }
    }

}
