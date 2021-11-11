//
//  StockViewModel.swift
//  Stocks-app
//
//  Created by Lado Tsivtsivadze on 11/8/21.
//

import Foundation

struct StockViewModel {
    
    let stock: Stock
    
    var symbol: String {
        stock.symbol ?? "No Symbol"
    }
    var description: String {
        stock.description ?? "No Description"
    }
    var price: String {
        stock.price == nil ? "No Price" : String(format: "%.2f", stock.price!)
    }
    var change: String {
        stock.change ?? "No Change Data"
    }
}
