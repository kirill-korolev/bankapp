//
//  HomeTableView.swift
//  BankApp
//
//  Created by Kirill Korolev on 08.02.17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import UIKit

class HomeTableView: UITableView, TableSegueProtocol {

    var parent: EventReceiverProtocol!
    let tableViewDelegate = TableViewDelegate()
    let nibs = ["CardCell", "DepositCell", "GoalCell"]
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        NotificationCenter.default.addObserver(self, selector: #selector(initDrawing(_:)), name: .CardsHaveBeenLoadedNotification, object: nil)
        self.tableFooterView = UIView(frame: CGRect.zero)
        self.registerNibs()
    }
    
    func initDrawing(_ sender: Any?){
        self.delegate = tableViewDelegate
        self.dataSource = tableViewDelegate
        self.reloadData()
    }
    
    func registerNibs(){
        
        for i in 0..<nibs.count{
            let nib = UINib(nibName: nibs[i], bundle: nil)
            self.register(nib, forCellReuseIdentifier: nibs[i])
        }
        
    }
    
    func prepareForSegue(data: Any?, segue: SegueID){
        self.parent.initSegueFromSubview(data: data, segue: segue)
    }
   

}
