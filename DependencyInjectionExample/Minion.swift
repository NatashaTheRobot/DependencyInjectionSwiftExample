//
//  Minion.swift
//  DependencyInjectionExample
//
//  Created by Natasha Murashev on 1/1/15.
//  Copyright (c) 2015 NatashaTheRobot. All rights reserved.
//

struct Minion {
    let name: String
}

extension Minion: Equatable {}
func == (lhs: Minion, rhs: Minion) -> Bool {
    return lhs.name == rhs.name
}


