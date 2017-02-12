//
//  TableViewDelegate.swift
//  BankApp
//
//  Created by Kirill Korolev on 08.02.17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import UIKit

class TableViewDelegate: NSObject, UITableViewDataSource, UITableViewDelegate, HomeTableDataDelegate {
    
    let tableData = HomeTableData.instance
    var cards: [Card]!
    
    //Constants
    let headerHeight: CGFloat = 45.0
    
    
    
    override init() {
        super.init()
        tableData.delegate = self
        cards = []
    }
    
    //MARK: - HomeTableDataDelegate
    
    func cardsDidLoad(cards: NSArray){
        self.cards = cards as! [Card]
        NotificationCenter.default.post(name: .CardsHaveBeenLoadedNotification, object: nil)
    }
    
    //MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableData.sections.count
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0.0, y: tableView.frame.origin.y, width: tableView.frame.size.width, height: headerHeight))
        
        headerView.backgroundColor = #colorLiteral(red: 0.681284368, green: 0.7729433775, blue: 0.8533419967, alpha: 1).withAlphaComponent(0.3)
        
        //Custom label
        let label = UILabel(frame: CGRect(x: 15.0, y: 0.0, width: tableView.frame.size.width, height: headerHeight))
        label.text = tableData.sections[section]
        label.textColor = UIColor.black.withAlphaComponent(0.5)
        headerView.addSubview(label)
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return cards.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let row = indexPath.row
        
        cell.textLabel?.text = cards[row].title
        
        return cell
    }
    
}
