//
//  MenuViewController.swift
//  BankApp
//
//  Created by Kirill Korolev on 06.02.17.
//  Copyright © 2017 Kirill Korolev. All rights reserved.
//

import UIKit


//MARK: - Notification Extension

extension Notification.Name
{
    static let DidSelectCellAtIndexNotification = Notification.Name("DidSelectCellAtIndexNotification")
    
}

//MARK: - Gesture Extension

public extension UIViewController
{
    func addGestureToScene()
    {
        if(self.revealViewController() != nil)
        {
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
}

//MARK: - Main Frame

class MenuWireframe: UIViewController {
    
    @IBOutlet weak var topView: UIView!
    @IBOutlet weak var bottomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Default menu size
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width/3*2
    }
    
}

//MARK: - Table Delegate

class MenuViewDelegate: NSObject, UITableViewDelegate
{
    var parentController: UITableViewController?
    let selectedBGColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).withAlphaComponent(0.1)
    var selectedID: IndexPath?
    
    func updateCellsInTableView(tableView: UITableView)
    {
        let numberOfRows = tableView.numberOfRows(inSection: 0)
        
        for i in 0..<numberOfRows
        {
            let indexPath = IndexPath(row: i, section: 0)
            let cell = tableView.cellForRow(at: indexPath)
            cell?.backgroundColor = UIColor.clear
        }
        
        selectedID = nil
       
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        //Setting the initial state
        
        if parentController is TopMenuViewController
        {
            if indexPath.row == 0
            {
                cell.backgroundColor = selectedBGColor
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        NotificationCenter.default.post(name: .DidSelectCellAtIndexNotification, object: nil, userInfo: ["parent":parentController!])
        
        let cell = tableView.cellForRow(at: indexPath)
        
        if selectedID != nil
        {
            let activeCell = tableView.cellForRow(at: selectedID!)
            
            if selectedID != indexPath{
                activeCell?.backgroundColor = UIColor.clear
                cell?.backgroundColor = selectedBGColor
            }
        }
        else{
            let initialStateCell = tableView.cellForRow(at: IndexPath.init(row: 0, section: 0))
            initialStateCell?.backgroundColor = UIColor.clear
            cell?.backgroundColor = selectedBGColor
        }
        
        selectedID = indexPath
    }
    
    
}
