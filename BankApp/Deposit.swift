//
//  Deposit.swift
//  BankApp
//
//  Created by Kirill Korolev on 25/05/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import Foundation

class Deposit: NSObject{
    let initialSum: Int
    let date: String
    
    init(initialSum: Int, date: String){
        self.initialSum = initialSum
        self.date = date
    }
}
