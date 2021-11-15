//
//  String+Extensions.swift
//  GoodWeather
//
//  Created by Lado Tsivtsivadze on 11/15/21.
//

import Foundation

extension String {
    var escaped: String {
        self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self
    }
}
