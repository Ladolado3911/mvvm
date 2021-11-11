//
//  StockListViewModel.swift
//  Stocks-app
//
//  Created by Lado Tsivtsivadze on 11/8/21.
//

import Foundation
import UIKit

class StockListViewModel: ObservableObject {
    
    var searchTerm: String = ""
    var stocks: [StockViewModel] = []
    
    func load(for tableView: UITableView) {
        fetchStocks(for: tableView)
    }
    
    func numberOfRowsInSection() -> Int {
        return stocks.count
    }
    
    func vmForRowAt(index: Int) -> StockViewModel {
        return stocks[index]
    }
    
    private func fetchStocks(for tableView: UITableView) {
        Webservice().getStocks { [weak self] stocks in
            DispatchQueue.main.async {
                if let stocks = stocks {
                    self?.stocks = stocks.map { StockViewModel(stock: $0) }
                    tableView.reloadData()
                }
            }
        }
    }
}
