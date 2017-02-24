//
//  TestWireframe.swift
//  BankApp
//
//  Created by Kirill Korolev on 06.02.17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import UIKit

extension Notification.Name{
    static let CardsHaveBeenLoadedNotification = Notification.Name("CardsHaveBeenLoadedNotification")
}

enum SegueID: String{
    case cards = "cardDescriptionSegue"
    case transfer = "transferSegue"
    case payment = "paymentSegue"
}

class HomeWireframe: UIViewController, EventReceiverProtocol {
    
    @IBOutlet weak var tableView: HomeTableView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        //Loading data
        let user = UserDefaults.standard.loadObjectWithKey(key: "user") as! User
        HomeTableData.instance.loadCards(id: user.id)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addGestureToScene()
        tableView.parent = self
    }

    func initSegueFromSubview(data: Any?, segue: SegueID){
        self.performSegue(withIdentifier: segue.rawValue, sender: data)
    }
    
}
