//
//  HomeTableView.swift
//  BankApp
//
//  Created by Kirill Korolev on 08.02.17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import UIKit

class HomeTableView: UITableView {

    let tableViewDelegate = TableViewDelegate()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        NotificationCenter.default.addObserver(self, selector: #selector(initDrawing(_:)), name: .CardsHaveBeenLoadedNotification, object: nil)
        self.tableFooterView = UIView(frame: CGRect.zero)
    }
    
    func initDrawing(_ sender: Any?){
        self.delegate = tableViewDelegate
        self.dataSource = tableViewDelegate
        self.reloadData()
    }
    
    

}
