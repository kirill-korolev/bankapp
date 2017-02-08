//
//  FrontViewRouter.swift
//  BankApp
//
//  Created by Kirill Korolev on 07.02.17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import UIKit

class FrontViewRouter: UINavigationController {
}

class FrontViewNavBar: UINavigationBar
{
    let bgColor: UIColor = #colorLiteral(red: 0.4315513968, green: 0.7840228081, blue: 0.3768854439, alpha: 1)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.barTintColor = bgColor
    }
    
}


