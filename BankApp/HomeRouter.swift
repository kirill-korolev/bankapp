//
//  HomeRouter.swift
//  BankApp
//
//  Created by Kirill Korolev on 07.02.17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import UIKit


class HomeRouter: FrontViewRouter {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func invoke(with segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CardDescriptionWireframe{
            destination.card = sender as! Card
        }
    }

}
