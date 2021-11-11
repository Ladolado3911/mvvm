//
//  Order.swift
//  CoffeeApp
//
//  Created by Lado Tsivtsivadze on 11/8/21.
//

import UIKit

enum CoffeeType: String, Codable, CaseIterable {
    case cappuccino = "Cappuccino"
    case latte = "Latte"
    case espressino = "Espressino"
    case cortado = "Cortado"
}

enum CoffeeSize: String, Codable, CaseIterable {
    case small = "Small"
    case medium = "Medium"
    case large = "Large"
}

struct Order: Codable {
    var name: String
    var email: String
    var type: CoffeeType
    var size: CoffeeSize
}

extension Order {
    init?(_ vm: AddCoffeeOrderViewModel) {
        guard let name = vm.name,
              let email = vm.email,
              let type = vm.orderType,
              let size = vm.orderSize
        else {
            return nil
        }
        self.name = name
        self.email = email
        self.type = type
        self.size = size
    }
    
    static func createResource(_ vm: AddCoffeeOrderViewModel) -> Resource<Order> {
        let order = Order(vm)
        guard let url = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else {
            fatalError("Invalid URL")
        }
        guard let data = try? JSONEncoder().encode(order) else {
            fatalError("could not encode")
        }
        var resource = Resource<Order>(url: url)
        resource.httpMethod = .post
        resource.body = data
        
        return resource
    }
}
