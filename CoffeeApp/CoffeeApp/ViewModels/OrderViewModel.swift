//
//  OrderViewModel.swift
//  CoffeeApp
//
//  Created by Lado Tsivtsivadze on 11/8/21.
//

import Foundation


class OrderListViewModel {
    var orders: [OrderViewModel]
    
    init() {
        orders = [OrderViewModel]()
    }
    
    func orderViewModel(at index: Int) -> OrderViewModel {
        return self.orders[index]
    }
}

struct OrderViewModel {
    let order: Order
    
    var name: String {
        return self.order.name.capitalized
    }
    
    var email: String {
        return self.order.email.capitalized
    }
    
    var type: String {
        return self.order.type.rawValue.capitalized 
    }
    
    var size: String {
        return self.order.size.rawValue.capitalized
    }
}
