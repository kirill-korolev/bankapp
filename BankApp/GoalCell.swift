//
//  GoalCell.swift
//  BankApp
//
//  Created by Kirill Korolev on 17.02.17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import UIKit

class GoalCell: UITableViewCell {

    @IBOutlet weak var sumLabel: UILabel!
    @IBOutlet weak var termLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
