//
//  TrendsViewController.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 28/08/17.
//  Copyright (c) 2017 Rafael Leandro. All rights reserved.
//

import UIKit

protocol TrendsViewInput: class {
    func displayError(error: String)
    func displayTweets(viewModels: [Trends.ViewModel])
}

protocol TrendsViewOutput {
    func loadTrends(request: Trends.Request)
}

class TrendsViewController: UIViewController, TrendsViewInput
{
    var output:  TrendsViewOutput!

    var data: [Trends.ViewModel] = []
    
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: Object lifecycle
    override func awakeFromNib()
    {
        super.awakeFromNib()
        let configurator = TrendsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: self)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        let configurator = TrendsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: self)
    }

    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        let configurator = TrendsModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: self)
    }

    // MARK: View lifecycle

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "TrendsTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60
        
        let request = Trends.Request(woeid: "23424768")
        self.output.loadTrends(request: request)
    }
    
    func displayError(error: String){
        let alert = UIAlertController(title: "Erro", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func displayTweets(viewModels: [Trends.ViewModel]){
        data = viewModels
        tableView.reloadData()
    }
}
