//
//  ProfileRouter.swift
//  BankApp
//
//  Created by Kirill Korolev on 08.02.17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import UIKit

class ProfileRouter: FrontViewRouter {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func updateViewWithData(user: User)
    {
        self.navigationBar.topItem!.title = user.fullname
    }
    
    
}
