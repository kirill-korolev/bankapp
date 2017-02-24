//
//  TableViewDelegate.swift
//  BankApp
//
//  Created by Kirill Korolev on 08.02.17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import UIKit

enum Section: Int{
    case cards = 0
    case deposits = 1
    case goals = 2
}

class TableViewDelegate: NSObject, UITableViewDataSource, UITableViewDelegate, HomeTableDataDelegate {
    
    let tableData = HomeTableData.instance
    var cards: [Card]!
    var activeRow: IndexPath?
    
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
    
    //MARK: - Gestures
    
    func didTouchHeader(_ sender: UIButton){
        
        
        
    }
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let cell = tableView.cellForRow(at: indexPath)
        
        if activeRow != nil{
            let disabledCell = tableView.cellForRow(at: activeRow!)
            disabledCell?.backgroundColor = .white
        }
        
        cell?.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1).withAlphaComponent(0.1)
        
        if indexPath.section == Section.cards.rawValue{
            if cards.count > 0{
                let card = cards[indexPath.row]
                if let table = tableView as? TableSegueProtocol{
                    table.prepareForSegue(data: card, segue: SegueID.cards)
                }
            }
        }
        else if indexPath.section == Section.deposits.rawValue{
            
        }
        else if indexPath.section == Section.goals.rawValue{
            
        }
        
        activeRow = indexPath
    }
    
    //MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return tableData.sections.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let headerView = UIView(frame: CGRect(x: 0.0, y: tableView.frame.origin.y, width: tableView.frame.size.width, height: headerHeight))
        
        headerView.backgroundColor = #colorLiteral(red: 0.9120810628, green: 0.9349395633, blue: 0.9612939954, alpha: 1)
        
        //Custom label
        let label = UILabel(frame: CGRect(x: 15.0, y: 0.0, width: tableView.frame.size.width, height: headerHeight))
        label.text = tableData.sections[section]
        label.textColor = UIColor.black.withAlphaComponent(0.5)
        headerView.addSubview(label)
        
        /*let backgroundButton = UIButton(frame: headerView.frame)
        backgroundButton.addTarget(self, action: #selector(didTouchHeader(_:section:)), for: .touchUpInside)
        
        headerView.addSubview(backgroundButton)
        */
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case Section.cards.rawValue:
            return cards.count != 0 ? cards.count: 1
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == Section.cards.rawValue{
            if cards.count > 0{
                return cellForCard(tableView, cellForRowAt: indexPath)
            }
            else{
                return cellForEmptyCard(tableView, cellForRowAt: indexPath)
            }
        }
        else if indexPath.section == Section.deposits.rawValue{
            return cellForEmptyDeposit(tableView, cellForRowAt: indexPath)
        }
        else if indexPath.section == Section.goals.rawValue{
            return cellForEmptyGoal(tableView, cellForRowAt: indexPath)
        }
        
        return UITableViewCell()
    }
    
    
    func cellForCard(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardCell", for: indexPath) as! CardCell
        let row = indexPath.row
        let title = cards[row].title
        let balance = cards[row].balance
        let number = String(cards[row].info.number)
        let index = number!.index(number!.endIndex, offsetBy: -4)
        let securedNumber = "**** \(number!.substring(from: index))"
        var image: UIImage
        
        
        switch cards[row].info.title{
        case .visa:
            image = #imageLiteral(resourceName: "visa")
        case .mastercard:
            image = #imageLiteral(resourceName: "mastercard")
        case .maestro:
            image = #imageLiteral(resourceName: "maestro")
        }
        
        cell.titleLabel.text = title
        cell.numberLabel.text = securedNumber
        cell.balanceLabel.text = "\(balance.stringFormat) Р"
        cell.cardProducerView.image = image
        
        
        
        return cell
    }
    func cellForEmptyCard(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = "К сожалению, у вас нет доступных карт"
        cell.selectionStyle = .none
        return cell
    }
    
    func cellForEmptyDeposit(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "DepositCell", for: indexPath) as! DepositCell
        
        return cell
    }
    func cellForEmptyGoal(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "GoalCell", for: indexPath) as! GoalCell
        
        return cell
    }
}
