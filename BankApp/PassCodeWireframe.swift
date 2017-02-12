//
//  PassCodeView.swift
//  BankApp
//
//  Created by Kirill Korolev on 10.02.17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import UIKit
import SmileLock

class PassCodeWireframe: UIViewController {

    let numberOfDigits = 4
    var passwordContainerView: PasswordContainerView!
    var isInitial: Bool!
    var user: User!
    @IBOutlet weak var externalContainer: UIView!
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Container View Settings
        passwordContainerView = PasswordContainerView.createWithDigit(numberOfDigits)
        passwordContainerView.frame = externalContainer.bounds
        passwordContainerView.delegate = self
        externalContainer.addSubview(passwordContainerView)
        
        user = UserDefaults.standard.loadObjectWithKey(key: "user") as! User
        
        if user.code != nil{
            isInitial = false
            let name = user.fullname.components(separatedBy: " ")[0]
            welcomeLabel.text = "Здравствуйте, " + name
        }
        else{
            isInitial = true
            welcomeLabel.text = "Придумайте код для авторизации"
        }
        
    }
    
}

//MARK: PasswordInputCompleteProtocol

extension PassCodeWireframe: PasswordInputCompleteProtocol
{
    func passwordInputComplete(_ passwordContainerView: PasswordContainerView, input: String) {
        
        
        if isInitial != true {
            
            if user.code == input
            {
                print("proceed")
            }
            else{
                passwordContainerView.clearInput()
                return
            }
            
        }
        else{
            user.code = input
            UserDefaults.standard.saveObject(object: user, key: "user")
        }
        
        DispatchQueue.main.async {
            self.performSegue(withIdentifier: "mainScreenSegue", sender: self)
        }

    }
    
    func touchAuthenticationComplete(_ passwordContainerView: PasswordContainerView, success: Bool, error: NSError?) {
        
        if success
        {
            
        }
        else
        {
            passwordContainerView.clearInput()
        }
        
    }
}
