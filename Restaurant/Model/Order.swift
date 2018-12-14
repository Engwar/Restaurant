//
//  Order.swift
//  Restaurant
//
//  Created by Igor Shelginskiy on 12/14/18.
//  Copyright © 2018 Igor Shelginskiy. All rights reserved.
//

import Foundation

struct Order: Codable {
    var menuItems: [MenuItem]
    
    init(menuItems: [MenuItem] = []) {
        self.menuItems = menuItems
    }
}
