//
//  Stock.swift
//  Stocks-app
//
//  Created by Lado Tsivtsivadze on 11/8/21.
//

import UIKit

struct Stock: Decodable {
    var symbol: String?
    var description: String?
    var price: Int?
    var change: String?
}
