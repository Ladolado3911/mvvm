//
//  Webservice.swift
//  Stocks-app
//
//  Created by Lado Tsivtsivadze on 11/8/21.
//

import UIKit

struct Endpoints {
    static let stocksEndpoint: String = "https://island-bramble.glitch.me/stocks"
    static let topNewsEndpoint: String = "https://island-bramble.glitch.me/top-news"
}

class Webservice {
    
    func getArticles(completion: @escaping ([Article]?) -> Void) {
        guard let url = URL(string: Endpoints.topNewsEndpoint) else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("error is: \(error)")
                completion(nil)
                return
            }
            if let data = data {
                if let result = try? JSONDecoder().decode([Article].self, from: data) {
                    DispatchQueue.main.async {
                        completion(result)
                    }
                    return
                }
                else {
                    completion(nil)
                    return
                }
            }
            else {
                completion(nil)
            }
        }.resume()
    }
    
    func getStocks(completion: @escaping ([Stock]?) -> Void) {
        guard let url = URL(string: Endpoints.stocksEndpoint) else {
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(nil)
                print(error)
                return
            }
            if let data = data {
                if let result = try? JSONDecoder().decode([Stock].self, from: data) {
                    DispatchQueue.main.async {
                        completion(result)
                    }
                }
            }
        }.resume()
    }
}
