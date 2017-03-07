//
//  ProfileWireframe.swift
//  BankApp
//
//  Created by Kirill Korolev on 08.02.17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import UIKit

class ProfileWireframe: Mainframe {
    
    var navController: ProfileRouter!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addGestureToScene()
        
        let user = UserDefaults.standard.loadObjectWithKey(key: "user") as! User
        self.navigationController?.navigationBar.topItem!.title = user.fullname
    }


}
