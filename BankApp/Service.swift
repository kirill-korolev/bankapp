//
//  Service.swift
//  BankApp
//
//  Created by Kirill Korolev on 25/05/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import Foundation

class Service: NSObject{
    
    let title: String
    let category: Int
    let image: UIImage
    
    init(title: String, category: Int, image: UIImage){
        self.title = title
        self.category = category
        self.image = image
    }
    
    
}
