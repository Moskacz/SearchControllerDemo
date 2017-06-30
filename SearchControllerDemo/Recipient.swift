//
//  Recipient.swift
//  SearchControllerDemo
//
//  Created by Michał Moskała on 30.06.2017.
//  Copyright © 2017 Michal Moskala. All rights reserved.
//

import Foundation

struct Recipient {
    let firstName: String
    let lastName: String
    
    func fullName() -> String {
        return "\(firstName) \(lastName)"
    }
}
