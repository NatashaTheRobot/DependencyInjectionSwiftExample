//
//  MinionService.swift
//  DependencyInjectionExample
//
//  Created by Natasha Murashev on 1/1/15.
//  Copyright (c) 2015 NatashaTheRobot. All rights reserved.
//

class MinionService {
    
    func getTheMinions(completionHandler: ([Minion]) -> Void) {
        println("getting minions assynchronously")
        let result = [Minion(name: "Bob"), Minion(name: "Dave")]
        completionHandler(result)
    }
    
}
