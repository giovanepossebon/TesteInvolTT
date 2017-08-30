//
//  MainViewController.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 27/08/17.
//  Copyright © 2017 Rafael Leandro. All rights reserved.
//
import UIKit

protocol MainViewInput: class {
    
}

protocol MainViewOutput {
}

class MainViewController: UIViewController, MainViewInput
{
    var output:  MainViewOutput!
    
    @IBOutlet weak var feedButton: UIButton!
    @IBOutlet weak var trendsButton: UIButton!
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var tabStackView: CustomStackView!
    @IBOutlet weak var container: UIView!
    
    private let feed = FeedViewController(nibName: "FeedViewController", bundle: nil)
    private let search = SearchViewController(nibName: "SearchViewController", bundle: nil)
    private let trends = TrendsViewController(nibName: "TrendsViewController", bundle: nil)
    
    private var activeViewController: UIViewController? {
        didSet {
            removeInactiveViewController(inactiveViewController: oldValue)
            updateActiveViewController()
        }
    }
    
    private var feedBtOriginY = CGFloat()
    private var trendsBtOriginY = CGFloat()
    private var searchBtOriginY = CGFloat()
    
    // MARK: Object lifecycle
    override func awakeFromNib()
    {
        super.awakeFromNib()
        let configurator = MainModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: self)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        let configurator = MainModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: self)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        let configurator = MainModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: self)
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        self.tabStackView.backgroundColor = UIColor(red:0.92, green:0.92, blue:0.92, alpha:1.0)
        self.navigationController?.navigationBar.isHidden = false
        self.activeViewController = feed
        
        self.title = "Timeline"
        self.navigationItem.setHidesBackButton(true, animated:true);
        
        feedBtOriginY = feedButton.frame.origin.y
        trendsBtOriginY = trendsButton.frame.origin.y
        searchBtOriginY = searchButton.frame.origin.y
    }
    
    // MARK: IBACtions
    
    @IBAction func didFeedTapped(_ sender: Any) {
        self.feedButton.frame = CGRect(x: feedButton.frame.origin.x, y: -4, width: feedButton.frame.width, height: feedButton.frame.height)
        self.trendsButton.frame = CGRect(x: trendsButton.frame.origin.x, y: trendsBtOriginY, width: trendsButton.frame.width, height: trendsButton.frame.height)
        self.searchButton.frame = CGRect(x: searchButton.frame.origin.x, y: searchBtOriginY, width: searchButton.frame.width, height: searchButton.frame.height)
        
        self.activeViewController = feed
        self.title = "Timeline"
    }
    
    @IBAction func didTrendsTapped(_ sender: Any) {
        self.feedButton.frame = CGRect(x: feedButton.frame.origin.x, y: feedBtOriginY, width: feedButton.frame.width, height: feedButton.frame.height)
        self.trendsButton.frame = CGRect(x: trendsButton.frame.origin.x, y: -3, width: trendsButton.frame.width, height: trendsButton.frame.height)
        self.searchButton.frame = CGRect(x: searchButton.frame.origin.x, y: searchBtOriginY, width: searchButton.frame.width, height: searchButton.frame.height)
        self.activeViewController = trends
        self.title = "Trends: Brasil"
    }
    
    @IBAction func didSearchTapped(_ sender: Any) {
        self.feedButton.frame = CGRect(x: feedButton.frame.origin.x, y: feedBtOriginY, width: feedButton.frame.width, height: feedButton.frame.height)
        self.trendsButton.frame = CGRect(x: trendsButton.frame.origin.x, y: trendsBtOriginY, width: trendsButton.frame.width, height: trendsButton.frame.height)
        self.searchButton.frame = CGRect(x: searchButton.frame.origin.x, y: -2, width: searchButton.frame.width, height: searchButton.frame.height)
        
        self.activeViewController = search
        self.title = "Busca"
    }
    
    // MARK: Display Logic
    private func removeInactiveViewController(inactiveViewController: UIViewController?) {
        if let inActiveVC = inactiveViewController {
            // call before removing child view controller's view from hierarchy
            inActiveVC.willMove(toParentViewController: nil)
            
            inActiveVC.view.removeFromSuperview()
            
            // call after removing child view controller's view from hierarchy
            inActiveVC.removeFromParentViewController()
        }
    }
    
    private func updateActiveViewController() {
        if let activeVC = activeViewController {
            // call before adding child view controller's view as subview
            addChildViewController(activeVC)
            
            activeVC.view.frame = container.bounds
            container.addSubview(activeVC.view)
            
            // call before adding child view controller's view as subview
            activeVC.didMove(toParentViewController: self)
        }
    }
    
    
}
