//
//  SearchViewController.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 28/08/17.
//  Copyright (c) 2017 Rafael Leandro. All rights reserved.
//

import UIKit

protocol SearchViewInput: class {
    func displayError(error: String)
    func displayResults(viewModel: [Search.ViewModel])
}

protocol SearchViewOutput {
    func search(request: Search.Request)
}

class SearchViewController: UIViewController, SearchViewInput
{
    var output:  SearchViewOutput!

    // MARK: IBOutlet
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    internal var data: [Search.ViewModel] = []
    
    
    // MARK: Object lifecycle
    override func awakeFromNib()
    {
        super.awakeFromNib()
        let configurator = SearchModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: self)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        let configurator = SearchModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: self)
    }

    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        let configurator = SearchModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: self)
    }

    // MARK: View lifecycle

    override func viewDidLoad()
    {
        super.viewDidLoad()
        // tableView config
        let nib = UINib(nibName: "TweetCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60
        //Search config
        searchBar.delegate = self
    }
    
    func displayError(error: String){
        let alert = UIAlertController(title: "Erro", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func displayResults(viewModel: [Search.ViewModel]){
        data = viewModel
        tableView.reloadData()
    }
}
