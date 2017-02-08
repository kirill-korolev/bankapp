//
//  TestWireframe.swift
//  BankApp
//
//  Created by Kirill Korolev on 06.02.17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import UIKit

class HomeWireframe: UIViewController {
    
    @IBOutlet weak var tableView: HomeTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addGestureToScene()
    }

    
    
}
