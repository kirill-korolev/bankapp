//
//  CodeButton.swift
//  BankApp
//
//  Created by Kirill Korolev on 08.02.17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import UIKit

@IBDesignable
class CodeButton: UIButton {

    let bgColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    
    override func layoutSubviews() {
        self.backgroundColor = bgColor
        let point = self.frame.origin
        let size = CGSize(width: 50.0, height: 50.0)
        self.frame = CGRect(x:point.x, y:point.y, width: size.width, height: size.height)
        self.titleLabel?.textColor = UIColor.black
        self.layer.cornerRadius = size.width/2
        self.layer.masksToBounds = true
    }
}
