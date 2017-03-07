//
//  CardDescriptionWireframe.swift
//  BankApp
//
//  Created by Kirill Korolev on 27/02/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import UIKit

class CardDescriptionWireframe: UIViewController, UITableViewDelegate, UITableViewDataSource{

    var card: Card!

    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var table: UITableView!
    
    let headerHeight: CGFloat = 35.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.delegate = self
        table.dataSource = self
        table.tableFooterView = UIView(frame: CGRect.zero)
        
        var infoType: String
        
        switch card.info.type{
            case .credit:
                infoType = "Кредитная"
            case .debit:
                infoType = "Дебетовая"
            case .overdraft:
                infoType = "Овердрафтная"
        }
        
        balanceLabel.text = "\(card.balance.stringFormat) Р"
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = card.title
    }
    
    //MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame:CGRect(x: 0.0, y: tableView.frame.origin.y, width: tableView.frame.size.width, height: headerHeight))
        
        headerView.backgroundColor = #colorLiteral(red: 0.9120810628, green: 0.9349395633, blue: 0.9612939954, alpha: 1)
        
        //Custom label
        let label = UILabel(frame: CGRect(x: 15.0, y: 0.0, width: tableView.frame.size.width, height: headerHeight))
        label.text = "Последние операции"
        label.textColor = UIColor.black.withAlphaComponent(0.5)
        headerView.addSubview(label)
        
        
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return headerHeight
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    

}
