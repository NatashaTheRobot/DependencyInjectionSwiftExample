//
//  ViewControllerSpec.swift
//  DependencyInjectionExample
//
//  Created by Natasha Murashev on 1/4/15.
//  Copyright (c) 2015 NatashaTheRobot. All rights reserved.
//

import UIKit
import Quick
import Nimble

class ViewControllerSpec: QuickSpec {
    
    class Fake_MinionService: MinionService {
        var getTheMinionsWasCalled = false
        var fakeResult: MinionService.MinionDataResult?
        
        override func getTheMinions(completionHandler: (MinionDataResult) -> Void) {
            getTheMinionsWasCalled = true
            completionHandler(fakeResult!)
        }
    }
    
    
    override func spec() {
        var viewController: ViewController!
        
        
        beforeEach {
            let storyboard = UIStoryboard(name: "Main",
                bundle: NSBundle(forClass: self.dynamicType))
            let navigationController = storyboard.instantiateInitialViewController() as UINavigationController
            viewController = navigationController.topViewController as ViewController
            
            UIApplication.sharedApplication().keyWindow!.rootViewController = navigationController
            NSRunLoop.mainRunLoop().runUntilDate(NSDate())
        }
        
        
        
        describe(".fetchMinions") {
            context("Minions are fetched successfully") {
                it("sets the minions as the data source") {
                    let fakeMinionService = Fake_MinionService()
                    let minions = [Minion(name: "Bob"), Minion(name: "Dave")]
                    fakeMinionService.fakeResult = MinionService.MinionDataResult.Success(minions)
                    viewController.fetchMinions(minionService: fakeMinionService)
                    
                    expect(fakeMinionService.getTheMinionsWasCalled).to(beTrue())
                    
                    // optionals are handled for you! (dataSource in this case!)
                    expect(minions).to(equal(viewController.dataSource))
                }
            }
            context("There is an error fetching minions") {
                it("shows an alert with error") {
                    let fakeMinionService = Fake_MinionService()
                    let error = NSError(domain: "Error", code: 400, userInfo: [NSLocalizedDescriptionKey : "Oops! The Minions are missing on a new fun adventure!"])
                    fakeMinionService.fakeResult = MinionService.MinionDataResult.Failure(error)
                    viewController.fetchMinions(minionService: fakeMinionService)
                    
                    expect(fakeMinionService.getTheMinionsWasCalled).to(beTrue())
                    
                    expect(viewController.presentedViewController).toEventually(beAnInstanceOf(UIAlertController))
                }
            }
        }

    }

}
