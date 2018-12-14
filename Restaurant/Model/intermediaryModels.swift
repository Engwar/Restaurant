//
//  intermediaryModels.swift
//  Restaurant
//
//  Created by Igor Shelginskiy on 12/14/18.
//  Copyright © 2018 Igor Shelginskiy. All rights reserved.
//

import Foundation

struct Categories: Codable {
    let categories: [String]
}

struct PreparationTime: Codable {
    let prepTime: Int
    
    enum CodingKeys: String, CodingKey {
        case prepTime = "preparation_time"
    }
}
