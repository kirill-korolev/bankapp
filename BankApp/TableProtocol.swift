//
//  TableProtocol.swift
//  BankApp
//
//  Created by Kirill Korolev on 24/02/17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import Foundation

protocol EventReceiverProtocol{
    func initSegueFromSubview(data: Any?, segue: SegueID)
}

protocol TableSegueProtocol{
    func prepareForSegue(data: Any?, segue: SegueID)
}
