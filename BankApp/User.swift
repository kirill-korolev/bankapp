//
//  User.swift
//  BankApp
//
//  Created by Kirill Korolev on 11.02.17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import UIKit

extension UserDefaults
{
    func saveObject(object: Any, key: String)
    {
        let encoded = NSKeyedArchiver.archivedData(withRootObject: object)
        UserDefaults.standard.set(encoded, forKey: key)
        UserDefaults.standard.synchronize()
        
    }
    
    func loadObjectWithKey(key: String) -> Any?
    {
        guard let encoded = UserDefaults.standard.object(forKey: key) as? Data else
        {
            return nil
        }
        let object = NSKeyedUnarchiver.unarchiveObject(with: encoded)
        return object
        
    }
    
}

class User: NSObject, NSCoding {

    let fullname: String
    let email: String
    let password: String
    var code: String?
    let id: Int
    
    init(fullname: String, email: String, password: String, id: Int) {
        self.fullname = fullname
        self.email = email
        self.password = password
        self.id = id
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(self.fullname, forKey: "fullname")
        aCoder.encode(self.email, forKey: "email")
        aCoder.encode(self.password, forKey: "password")
        aCoder.encode(self.code, forKey: "code")
        aCoder.encode(self.id, forKey: "id")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.fullname = aDecoder.decodeObject(forKey: "fullname") as! String
        self.email = aDecoder.decodeObject(forKey: "email") as! String
        self.password = aDecoder.decodeObject(forKey: "password") as! String
        self.code = aDecoder.decodeObject(forKey: "code") as? String
        self.id = aDecoder.decodeInteger(forKey: "id")
    }

    
}
