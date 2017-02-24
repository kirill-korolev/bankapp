//
//  AuthWireframe.swift
//  BankApp
//
//  Created by Kirill Korolev on 11.02.17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import UIKit
import JSSAlertView

struct QueryError: OptionSet
{
    let rawValue: Int
    
    static let emailField = QueryError(rawValue: 1 << 0)
    static let passField = QueryError(rawValue: 1 << 1)
}

class AuthWireframe: UIViewController, UserDelegate {

    
    @IBOutlet weak var emailTextField: AuthTextField!
    @IBOutlet weak var passwordTextField: AuthTextField!
    
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        UserManager.instance.delegate = self
        
        if (UserDefaults.standard.loadObjectWithKey(key: "user") != nil)
        {
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "passCodeSegue", sender: self)
            }
            
        }
        
    }
    
    
    @IBAction func didTouchSignInButton(_ sender: Any) {
        
        let error: QueryError = catchErrorsBeforeSending(email: emailTextField.text, pass: passwordTextField.text)
        
        if error.isEmpty
        {
            let email = emailTextField.text!
            let password = passwordTextField.text!
            UserManager.instance.getUsers(email: email, password: password)
        }
        else if error.contains(.emailField) || error.contains(.passField)
        {
            showError(title: "Ошибка", text: "Вы не ввели необходимые данные!")
        }

        
    }
    
    
    func catchErrorsBeforeSending(email: String?, pass: String?) -> QueryError
    {
        var temp: QueryError = []
        
        if email == nil || email == ""
        {
            temp.insert(QueryError.emailField)
        }
        
        if pass == nil || pass == ""
        {
            temp.insert(QueryError.passField)
        }
        
        return temp
    }
    
    //MARK: - AlertViews
    
    func showError(title: String, text: String){
        let alertView = JSSAlertView().show(self, title: title, text: text, noButtons: false, buttonText: "ОК", cancelButtonText: nil, color: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1), iconImage: nil, delay: nil, timeLeft: nil)
        alertView.setTextTheme(.light)
    }
    
    
    //MARK: UserDelegate
    
    func usersDownloaded(users: NSArray) {
        self.users = users as! [User]
        
        if self.users.count > 0{
            let user = self.users[0]
            UserDefaults.standard.saveObject(object:user, key: "user")
            UserDefaults.standard.synchronize()
            
            DispatchQueue.main.async {
                self.performSegue(withIdentifier: "passCodeSegue", sender: self)
            }
        }
    }
    
    func didFinishWithError(connection: Bool){
        if !connection{
            showError(title: "Ошибка", text: "Отсутствует соединение с сервером!")
        }
    }
    
}
