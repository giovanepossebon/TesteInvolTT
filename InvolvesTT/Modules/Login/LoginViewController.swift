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
    
    
    // MARK: IBOutlets
    @IBOutlet weak var loginTextField: CustomTextField!
    @IBOutlet weak var passwordTextField: CustomTextField!
    
    
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
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(sender:)), name: NSNotification.Name.UIKeyboardDidShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(sender:)), name: NSNotification.Name.UIKeyboardDidHide, object: nil)
        configureViews()
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
    }
    
    
    private func configureViews(){
        _ = loginTextField.addBorder(edges: [.bottom], color: UIColor.white, thickness: 0.5)
        _ = passwordTextField.addBorder(edges: [.bottom], color: UIColor.white, thickness: 0.5)
        loginTextField.delegate = self
        passwordTextField.delegate = self
    }
    
    ///Control view when keyboard appears
    func keyboardWillShow(sender: NSNotification) {
        if let userInfo = sender.userInfo{
            if let keySize = userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue{
                self.view.frame.origin.y = -keySize.cgRectValue.height
            }
        }
    }
    
    func keyboardWillHide(sender: NSNotification) {
        self.view.frame.origin.y = 0 // Move view to original position
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


extension LoginViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text == "Email" || textField.text == "password"{
            textField.text = ""
        }
    }
}
