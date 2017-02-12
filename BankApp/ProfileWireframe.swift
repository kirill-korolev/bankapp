//
//  ProfileWireframe.swift
//  BankApp
//
//  Created by Kirill Korolev on 08.02.17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import UIKit

class ProfileWireframe: UIViewController {
    
    var navController: ProfileRouter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addGestureToScene()
        
        let user = UserDefaults.standard.loadObjectWithKey(key: "user") as! User
        navController = self.navigationController as! ProfileRouter
        navController.updateViewWithData(user: user)
    }


}
