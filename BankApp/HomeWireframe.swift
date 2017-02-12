//
//  TestWireframe.swift
//  BankApp
//
//  Created by Kirill Korolev on 06.02.17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import UIKit

extension Notification.Name{
    static let CardsHaveBeenLoadedNotification = Notification.Name("CardsHaveBeenLoadedNotification")
}


class HomeWireframe: UIViewController {
    
    @IBOutlet weak var tableView: HomeTableView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let user = UserDefaults.standard.loadObjectWithKey(key: "user") as! User
        HomeTableData.instance.loadCards(id: user.id)
        print("USER ID: \(user.id)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addGestureToScene()
    }

    
    
}
