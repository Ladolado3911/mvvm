//
//  StockListViewModel.swift
//  Stocks-app
//
//  Created by Lado Tsivtsivadze on 11/8/21.
//

import Foundation

class StockListViewModel: ObservableObject {
    
    var searchTerm: String = ""
    @Published var stocks: [StockViewModel] = []
    
    func load() {
        fetchStocks()
    }
    
    private func fetchStocks() {
        Webservice().getStocks { [weak self] stocks in
            DispatchQueue.main.async {
                if let stocks = stocks {
                    self?.stocks = stocks.map { StockViewModel(stock: $0) }
                }
            }
        }
    }
}
