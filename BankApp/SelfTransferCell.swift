//
//  SelfTransferCell.swift
//  BankApp
//
//  Created by Kirill Korolev on 25/05/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import UIKit

class SelfTransferCell: UITableViewCell {

    @IBOutlet weak var cardImage: UIImageView!
    @IBOutlet weak var cardTitle: UILabel!
    @IBOutlet weak var cardNumber: UILabel!
    @IBOutlet weak var containerView: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        containerView.layer.cornerRadius = 12.0
        containerView.layer.masksToBounds = true
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
