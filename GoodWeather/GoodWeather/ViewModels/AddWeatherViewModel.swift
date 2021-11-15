//
//  AddWeatherViewModel.swift
//  GoodWeather
//
//  Created by Lado Tsivtsivadze on 11/15/21.
//

import Foundation

class AddWeatherViewModel {
    
    func addWeather(city: String, completion: @escaping (WeatherViewModel) -> Void) {
        let weatherResource = Resource<WeatherResponse>(url: Endpoints.getWeatherString(city: city)!) { data in
            let result = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            return result
        }
        
        Webservice().load(resource: weatherResource) { result in
            if let result = result {
                completion(WeatherViewModel(weather: result))
            }
        }
    }
}
