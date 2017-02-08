//
//  BottomMenuViewController.swift
//  BankApp
//
//  Created by Kirill Korolev on 06.02.17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import UIKit

class BottomMenuViewController: MenuContainer {

    @IBOutlet weak var dataTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        self.dataTable.delegate = delegate
        self.mainTable = dataTable
    }

}
