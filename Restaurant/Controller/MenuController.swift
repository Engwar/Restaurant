//
//  MenuController.swift
//  Restaurant
//
//  Created by Igor Shelginskiy on 12/14/18.
//  Copyright © 2018 Igor Shelginskiy. All rights reserved.
//

import Foundation

class MenuController {
    
    static let shared = MenuController()
    
    var order = Order()
    
    let baseURL = URL(string: "http://server.getoutfit.ru:8090/")!
    
    //@escaping - атрибут
    func fetchCategories(completion: @escaping ([String]?)-> Void) {
        let categoryURL = baseURL.appendingPathComponent("categories")
        let task = URLSession.shared.dataTask(with: categoryURL) { data, _, _ in
            guard let data = data else {
                completion(nil)
                return
            }
            guard let jsonDictionary = ((try? JSONSerialization.jsonObject(with: data) as? [String: Any]) as [String : Any]??) else {
                completion(nil)
                return
            }
            let categories = jsonDictionary?["categories"] as? [String]
            completion(categories)
            
        }
        task.resume()
    }
    
    func fetchMenuItems(forCategory categoryName: String, completion: @escaping ([MenuItem]?)-> Void) {
        let initialMenuURL = baseURL.appendingPathComponent("menu")
        var components = URLComponents(url: initialMenuURL, resolvingAgainstBaseURL: true)!
        components.queryItems = [URLQueryItem(name: "category", value: categoryName)]
        let menuURL = components.url!
        let task = URLSession.shared.dataTask(with: menuURL) { data, _, _ in
            let jsonDecoder = JSONDecoder()
            guard let data = data else {
                completion(nil)
                return
            }
            let menuItems = try? jsonDecoder.decode(MenuItems.self, from: data)
            completion(menuItems?.items)
        }
        task.resume()
    }
    
    func submitOrder(formenuIDs menuIds: [Int], completion: @escaping (Int?)-> Void) {
        let orderUrL = baseURL.appendingPathComponent("order")
        var request = URLRequest(url: orderUrL)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let data: [String: [Int]] = ["menuIds": menuIds]
        let jsonEncoder = JSONEncoder()
        
        guard let jsonData = try? jsonEncoder.encode(data) else {
            completion(nil)
            return
        }
        
        request.httpBody = jsonData
        let task = URLSession.shared.dataTask(with: request) { data, _, _ in
            guard let data = data else {
                completion(nil)
                return
            }
            let jsonDecoder = JSONDecoder()
            guard let preparationTime = try? jsonDecoder.decode(PreparationTime.self, from: data)
                else {
                completion(nil)
                return
            }
            completion(preparationTime.prepTime)
        }
        task.resume()
    }
}
