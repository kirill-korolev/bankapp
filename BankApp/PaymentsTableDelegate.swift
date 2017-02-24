//
//  PaymentsTableDelegate.swift
//  BankApp
//
//  Created by Kirill Korolev on 18.02.17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import UIKit

class PaymentsTableDelegate: NSObject, UITableViewDelegate, UITableViewDataSource {

    let sections = [["Переводы", ["Между своими счетами","Клиенту Binary Bank","На карту в другой банк"]], ["Платежи",["Мобильная связь","Интернет и ТВ", "ЖКХ и домашний телефон"]]]
    
    let seguesID = ["transferSegue","paymentSegue"]
    
    var activeRow: IndexPath?
    
    //Constants
    let headerHeight: CGFloat = 45.0
    
    
    //MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if activeRow != nil{
            let disabledCell = tableView.cellForRow(at: activeRow!)
            disabledCell?.backgroundColor = .white
        }
        
        if let table = tableView as? TableSegueProtocol{
            let cell = tableView.cellForRow(at: indexPath)
            cell?.backgroundColor = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1).withAlphaComponent(0.1)
            let segue = seguesID[indexPath.section]
            table.prepareForSegue(data: nil, segue: SegueID(rawValue: segue)!)
        }
        
        activeRow = indexPath
    }
    
    //MARK: - UITableViewDataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0.0, y: tableView.frame.origin.y, width: tableView.frame.size.width, height: headerHeight))
        
        headerView.backgroundColor = #colorLiteral(red: 0.9120810628, green: 0.9349395633, blue: 0.9612939954, alpha: 1)
        
        //Custom label
        let label = UILabel(frame: CGRect(x: 15.0, y: 0.0, width: tableView.frame.size.width, height: headerHeight))
        label.text = sections[section][0] as? String
        label.textColor = UIColor.black.withAlphaComponent(0.5)
        headerView.addSubview(label)

        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let array = sections[section][1] as! [String]
        return array.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PaymentsCell", for: indexPath) as! PaymentsCell
        let section = indexPath.section
        let array = sections[section][1] as! [String]
        cell.label.text = array[indexPath.row]
        return cell
    }
    
}
