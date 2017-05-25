//
//  PaymentsWireframe.swift
//  BankApp
//
//  Created by Kirill Korolev on 07.02.17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import UIKit

protocol DataReceiver{
    var data: String? { get set }
}

class PaymentsWireframe: Mainframe, EventReceiverProtocol {

    @IBOutlet weak var tableView: PaymentsView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addGestureToScene()
        tableView.parent = self
    }
    
    //MARK: EventReceiverProtocol
    
    func initSegueFromSubview(data: Any?, segue: SegueID) {
        self.performSegue(withIdentifier: segue.rawValue, sender: data)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destination = segue.destination as! DataReceiver
        destination.data = sender as? String
    }
    
}
