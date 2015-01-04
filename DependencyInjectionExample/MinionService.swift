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
        println("pretend we're getting minions asynchronously")
        let minionData = [Minion(name: "Bob"), Minion(name: "Dave")]
        completionHandler(MinionDataResult.Success(minionData))
        
        // Uncomment if you want to test our an error scenario
//        let error = NSError(domain: "Error",
//            code: 400,
//            userInfo: [NSLocalizedDescriptionKey : "Oops! The Minions are missing on a new fun adventure!"])
//        completionHandler(MinionDataResult.Failure(error))
    }
    
}
