//
//  WeatherModel.swift
//  GoodWeather
//
//  Created by Lado Tsivtsivadze on 11/15/21.
//

import Foundation

struct WeatherResponse: Decodable {
    var name: String?
    var main: Weather?
}

struct Weather: Decodable {
    var temp: Double?
    var humidity: Double?
}
