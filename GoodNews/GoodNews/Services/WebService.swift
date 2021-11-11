//
//  WebService.swift
//  GoodNews
//
//  Created by Lado Tsivtsivadze on 11/5/21.
//

import Foundation

class WebService {
    func getArticles(url: URL, completion: @escaping ([Article]?) -> Void) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error is: \(error)")
                completion(nil)
            }
            else if let data = data {
                let decoded = try? JSONDecoder().decode(Response.self, from: data)
                if let decoded = decoded {
                    completion(decoded.articles)
                }
                else {
                    completion(nil)
                }
            }
        }.resume()
    }
}
