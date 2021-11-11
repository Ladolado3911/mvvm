//
//  AddCoffeeOrderViewModel.swift
//  CoffeeApp
//
//  Created by Lado Tsivtsivadze on 11/8/21.
//

import Foundation

class AddCoffeeOrderViewModel {
    
    var name: String?
    var email: String?
    
    var orderType: CoffeeType?
    var orderSize: CoffeeSize?
    
    var types: [String] {
        return CoffeeType.allCases.map { $0.rawValue.capitalized }
    }
    
    var sizes: [String] {
        return CoffeeSize.allCases.map { $0.rawValue.capitalized }
    }
}
