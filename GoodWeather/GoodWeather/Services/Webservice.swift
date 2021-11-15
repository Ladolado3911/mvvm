//
//  Webservice.swift
//  GoodWeather
//
//  Created by Lado Tsivtsivadze on 11/15/21.
//

import UIKit

struct Endpoints {
    static func getWeatherString(city: String) -> String { "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=27094f153e7a30c9c0ed94ec0a4e0839&units=imperial"
    }
}

struct Resource<T> {
    var url: URL
    var parse: (Data) -> T?
}

class Webservice {
    
    func load<T>(resource: Resource<T>, completion: @escaping (T?) -> Void) {
        let dataTask = URLSession.shared.dataTask(with: resource.url) { data, response, error in
            if let error = error {
                print(error)
                completion(nil)
                return
            }
            if let data = data {
                DispatchQueue.main.async {
                    completion(resource.parse(data))
                }
            }
        }
        dataTask.resume()
    }
}
