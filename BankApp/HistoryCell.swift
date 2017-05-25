//
//  HistoryCell.swift
//  BankApp
//
//  Created by Kirill Korolev on 24/05/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import UIKit

class HistoryCell: UITableViewCell {

    @IBOutlet weak var operationBill: UILabel!
    @IBOutlet weak var operationSum: UILabel!
    @IBOutlet weak var operationType: UILabel!
    @IBOutlet weak var operationDate: UILabel!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
