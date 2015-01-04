//
//  MinionService.swift
//  DependencyInjectionExample
//
//  Created by Natasha Murashev on 1/1/15.
//  Copyright (c) 2015 NatashaTheRobot. All rights reserved.
//

import Foundation

class MinionService {
    
    enum MinionDataResult {
        case Success([Minion])
        case Failure(NSError)
    }
    
    func getTheMinions(completionHandler: (MinionDataResult) -> Void) {
        println("getting minions assynchronously")
        let minionData = [Minion(name: "Bob"), Minion(name: "Dave")]
        completionHandler(MinionDataResult.Success(minionData))
    }
    
}
