//
//  MenuContainer.swift
//  BankApp
//
//  Created by Kirill Korolev on 08.02.17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import UIKit

class MenuContainer: UITableViewController {

    let delegate = MenuViewDelegate()
    var mainTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate.parentController = self
        NotificationCenter.default.addObserver(self, selector: #selector(notificationHandler(_:)), name: .DidSelectCellAtIndexNotification, object: nil)        
    }
    
    func notificationHandler(_ sender: Any?)
    {
        if self != (sender as! Notification).userInfo?["parent"] as? TopMenuViewController
        {
            self.delegate.updateCellsInTableView(tableView: mainTable)
        }
    }

}
