//
//  Operation.swift
//  BankApp
//
//  Created by Kirill Korolev on 22/05/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import Foundation

enum Receiver: Int{
    case service
    case user
}


class Operation: NSObject{
    let date:Date
    let sum:Float
    let bill:String
    let receiverID:NSDictionary?
    let receiver: Receiver
    let owner: Int
    
    init(date: Date, sum: Float, bill: String, receiverID: NSDictionary?, receiver: Receiver, owner: Int){
        self.date = date
        self.sum = sum
        self.bill = bill
        self.receiverID = receiverID
        self.receiver = receiver
        self.owner = owner
    }
}
