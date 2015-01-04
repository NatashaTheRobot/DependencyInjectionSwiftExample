//
//  ViewControllerTests.swift
//  DependencyInjectionExample
//
//  Created by Natasha Murashev on 1/1/15.
//  Copyright (c) 2015 NatashaTheRobot. All rights reserved.
//

import UIKit
import Foundation
import XCTest

class ViewControllerTests: XCTestCase {
    
    var viewController: ViewController!
    
    class Fake_MinionService: MinionService {
        var getTheMinionsWasCalled = false
        var result = [Minion(name: "Bob"), Minion(name: "Dave")]
        
        override func getTheMinions(completionHandler: (MinionDataResult) -> Void) {
            getTheMinionsWasCalled = true
            completionHandler(MinionDataResult.Success(result))
        }
    }
    
    override func setUp() {
        let storyboard = UIStoryboard(name: "Main",
            bundle: NSBundle(forClass: self.dynamicType))
        let navigationController = storyboard.instantiateInitialViewController() as UINavigationController
        viewController = navigationController.topViewController as ViewController
        
        UIApplication.sharedApplication().keyWindow!.rootViewController = navigationController
        NSRunLoop.mainRunLoop().runUntilDate(NSDate())
    }
    
    func test_fetchMinions() {
        let fakeMinionService = Fake_MinionService()
        
        viewController.fetchMinions(minionService: fakeMinionService)
        
        XCTAssertTrue(fakeMinionService.getTheMinionsWasCalled)
        
        if let dataSource = viewController.dataSource {
            XCTAssertEqual(fakeMinionService.result, dataSource)
        } else {
            XCTFail("Data Source should not be nil!!!")
        }
    }
}
