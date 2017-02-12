//
//  AuthTextField.swift
//  BankApp
//
//  Created by Kirill Korolev on 10.02.17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import UIKit

@IBDesignable
class AuthTextField: UITextField, UITextFieldDelegate {
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = 6.0
    }
    
    func boundsRect(bounds: CGRect) -> CGRect
    {
        return CGRect(x: bounds.origin.x + 10, y: bounds.origin.y + 8, width: bounds.size.width + 10, height: bounds.height - 16)
    }

    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return boundsRect(bounds: bounds)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return boundsRect(bounds: bounds)
    }
    
    
}
