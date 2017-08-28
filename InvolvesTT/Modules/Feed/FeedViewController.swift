//
//  FeedViewController.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 27/08/17.
//  Copyright (c) 2017 Rafael Leandro. All rights reserved.
//

import UIKit

protocol FeedViewInput: class {
    func displayError(error: String)
    func displayTweets(viewModels: [Feed.ViewModel])
}

protocol FeedViewOutput {
    func loadUserFeed()
}

class FeedViewController: UIViewController, FeedViewInput
{
    var output:  FeedViewOutput!
    var data: [Feed.ViewModel] = []
    // MARK: IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    
    // MARK: Object lifecycle
    override func awakeFromNib()
    {
        super.awakeFromNib()
        let configurator = FeedModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: self)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        let configurator = FeedModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: self)
    }

    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        let configurator = FeedModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: self)
    }

    // MARK: View lifecycle

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let nib = UINib(nibName: "TweetCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60
        
        self.output.loadUserFeed()
    }
    
    func displayError(error: String){
        let alert = UIAlertController(title: "Erro", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func displayTweets(viewModels: [Feed.ViewModel]){
        data = viewModels
        tableView.reloadData()
    }
}
