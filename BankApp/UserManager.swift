//
//  UserManager.swift
//  BankApp
//
//  Created by Kirill Korolev on 11.02.17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import UIKit

public protocol UserDelegate: class
{
    func usersDownloaded(users: NSArray)
}

class UserManager: NSObject, URLSessionDataDelegate {

    static let instance = UserManager()
    
    weak var delegate: UserDelegate!
    var data: NSMutableData!
    var urlPath: String!
 
    func getUsers(email: String, password: String)
    {
        urlPath = "http://thehomeland.ru/service/user.php?email="+email+"&password="+password
        data = NSMutableData()
        let url: URL = URL(string: urlPath)!
        var session: URLSession!
        let configuration = URLSessionConfiguration.default
        
        session = URLSession(configuration: configuration, delegate: self, delegateQueue: nil)
        let task = session.dataTask(with: url)
        task.resume()
        
    }
    
    
    //MARK: URLSessionDataDelegate
    
    func urlSession(_ session: URLSession, dataTask: URLSessionDataTask, didReceive data: Data)
    {
        self.data.append(data)
    }
    
    func urlSession(_ session: URLSession, task: URLSessionTask, didCompleteWithError error: Error?) {
        
        if error != nil {
            print("Failed to download data")
            return
        }
        
        print("Data has been downloaded")
        self.parseJSON()
        
    }
    
    
    func parseJSON()
    {
        var jsonResult = NSArray()
        
        do {
            try jsonResult = JSONSerialization.jsonObject(with: self.data as Data, options: .allowFragments) as! NSArray
        } catch let error {
            print(error)
        }
        
        var jsonDictionary = NSDictionary()
        let users = NSMutableArray()
        
        for i in 0..<jsonResult.count
        {
            jsonDictionary = jsonResult[i] as! NSDictionary
            
            let fullname = jsonDictionary["fullname"] as! String
            let email = jsonDictionary["email"] as! String
            let password = jsonDictionary["password"] as! String
            let id = jsonDictionary["id"] as! String
            let user = User(fullname: fullname, email: email, password: password, id:Int(id)!)
            users.add(user)
            
        }
        
        DispatchQueue.main.async {
            self.delegate.usersDownloaded(users: users)
        }
        
        
    }
    
    
    
}

