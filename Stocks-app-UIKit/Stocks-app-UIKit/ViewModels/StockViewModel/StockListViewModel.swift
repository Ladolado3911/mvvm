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
    var articles: [ArticleViewModel] = []
    
    func load(stockTableView: UITableView) {
        fetchStocks(for: stockTableView)
    }
    
    func load(articleTableView: UITableView) {
        fetchArticles(for: articleTableView)
    }
    
    func stocksNumberOfRowsInSection() -> Int {
        stocks.count
    }
    
    func articlesNumberOfRowsInSection() -> Int {
        articles.count
    }
    
    func articleVmForRowAt(index: Int) -> ArticleViewModel {
        articles[index]
    }
    
    func stockVmForRowAt(index: Int) -> StockViewModel {
        stocks[index]
    }
    
    private func fetchArticles(for tableView: UITableView) {
        Webservice().getArticles { [weak self] articles in
            if let articles = articles {
                self?.articles = articles.map { ArticleViewModel(article: $0) }
                tableView.reloadData()
            }
        }
    }
    
    private func fetchStocks(for tableView: UITableView) {
        Webservice().getStocks { [weak self] stocks in
            if let stocks = stocks {
                self?.stocks = stocks.map { StockViewModel(stock: $0) }
                tableView.reloadData()
            }
        }
    }
}
