//
//  LoginViewController.swift
//  InvolvesTT
//
//  Created by Rafael Leandro on 21/08/17.
//  Copyright © 2017 Rafael Leandro. All rights reserved.
//

import UIKit
import SafariServices

protocol LoginViewInput: class {
    func displayError(error: String)
}

protocol LoginViewOutput {
    func login()
}

class LoginViewController: UIViewController, LoginViewInput
{
    /// VIPER Output
    var output:  LoginViewOutput!
    
    
    // MARK: Object lifecycle
    override func awakeFromNib()
    {
        super.awakeFromNib()
        let configurator = LoginModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: self)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?)
    {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        let configurator = LoginModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: self)
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        let configurator = LoginModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: self)
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    

    // MARK: IBActions
    @IBAction func didLoginTapped(_ sender: Any) {
        self.output.login()
    }
    
    // MARK: Display logic
    func displayError(error: String){
        let alert = UIAlertController(title: "Erro", message: error, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}


extension LoginViewController: SFSafariViewControllerDelegate{
    
    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}
