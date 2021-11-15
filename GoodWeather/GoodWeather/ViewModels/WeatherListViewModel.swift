//
//  WeatherListViewModel.swift
//  GoodWeather
//
//  Created by Lado Tsivtsivadze on 11/15/21.
//

import Foundation

class WeatherListViewModel {
    
}

class WeatherViewModel {
    
    let weather: WeatherResponse
    
    init(weather: WeatherResponse) {
        self.weather = weather
    }
    
    var name: String {
        weather.name ?? "No Name"
    }
    
    var temperature: String {
        if let temp = weather.main?.temp {
            return "temperature: \(temp)"
        }
        else {
            return "No Temperature"
        }
    }
    
    var humidity: String {
        if let humidity = weather.main?.humidity {
            return "humidity: \(humidity)"
        }
        else {
            return "No Humidity"
        }
    }
}
