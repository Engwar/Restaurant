//
//  MenuItem.swift
//  Restaurant
//
//  Created by Igor Shelginskiy on 12/14/18.
//  Copyright © 2018 Igor Shelginskiy. All rights reserved.
//

import Foundation

struct MenuItem: Codable {
    var id: Int
    var name: String
    var detailtext: String
    var price: Double
    var category: String
    var imageURL: URL
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case detailtext = "description"
        case price
        case category
        case imageURL = "image_url"
    }
}

struct MenuItems: Codable {
    var items: [MenuItem]
}
