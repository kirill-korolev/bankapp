//
//  CardCell.swift
//  BankApp
//
//  Created by Kirill Korolev on 13.02.17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {

    
    @IBOutlet weak var cardProducerView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }
    
}
