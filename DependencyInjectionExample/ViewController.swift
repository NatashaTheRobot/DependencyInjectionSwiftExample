//
//  ViewController.swift
//  DependencyInjectionExample
//
//  Created by Natasha Murashev on 1/1/15.
//  Copyright (c) 2015 NatashaTheRobot. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var dataSource: [Minion]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchMinions()
    }
    
    func fetchMinions(minionService: MinionService = MinionService()) {
        minionService.getTheMinions { [unowned self](minionDataResult) -> Void in
            switch (minionDataResult) {
            case .Success(let minionsData):
                self.dataSource = minionsData
                self.tableView.reloadData()
            case .Failure(let error):
                let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .Alert)
                let okAction = UIAlertAction(title: "Ok", style: .Cancel, handler: nil)
                alertController.addAction(okAction)
                self.presentViewController(alertController, animated: true, completion: nil)
            }
            
        }
    }

    // MARK: UITableViewDataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("minionCell") as UITableViewCell
        
        if let minion = dataSource?[indexPath.row] {
            cell.textLabel?.text = minion.name
            cell.imageView?.image = UIImage(named: minion.name)
        }
        
        return cell
    }

}


