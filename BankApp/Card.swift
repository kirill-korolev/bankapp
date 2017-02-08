//
//  Card.swift
//  BankApp
//
//  Created by Kirill Korolev on 08.02.17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import Foundation

extension String{
    func fromBase64() -> String?
    {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }
        
        return String(data: data, encoding: .utf8)
    }
    
    func toBase64() -> String
    {
        return Data(self.utf8).base64EncodedString()
    }
}

enum CardType:String
{
    case credit = "Кредитная"
    case debit = "Дебетовая"
    case overdraft = "Овердрафтная"
}

enum CardProducer:String
{
    case visa = "Visa"
    case mastercard = "Mastercard"
}

struct CardInfo
{
    let type: CardType
    let title: CardProducer
    let number: String
    let cvv: Int
}

class Card{
    
    let title: String
    let info: CardInfo
    
    init(title: String, info: CardInfo) {
        self.title = title
        self.info = info
    }
    
}
