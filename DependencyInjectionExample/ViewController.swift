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
        minionService.getTheMinions { [unowned self](minions) -> Void in
            println("Show all the minions!")
            self.dataSource = minions
            self.tableView.reloadData()
        }
    }
    
    // MARK: UITableViewDataSource
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource?.count ?? 0
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let minion = dataSource?[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("minionCell") as UITableViewCell
        
        cell.textLabel?.text = minion?.name
        
        return cell
        
    }

}


