//
//  PaymentWireframe.swift
//  BankApp
//
//  Created by Kirill Korolev on 23.02.17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import UIKit

class PaymentWireframe: UIViewController, DataReceiver {

    var data: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = data
    }
}
