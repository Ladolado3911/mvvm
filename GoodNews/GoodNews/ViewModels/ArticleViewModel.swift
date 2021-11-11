//
//  ArticleViewModel.swift
//  GoodNews
//
//  Created by Lado Tsivtsivadze on 11/5/21.
//

import Foundation


struct ArticleListViewModel {
    var articles: [Article] = []
    
    var numberOfSections: Int {
        return 1
    }
    
    init(with articles: [Article]) {
        self.articles = articles
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        return ArticleViewModel(with: articles[index])
    }
}


struct ArticleViewModel {
    private let article: Article
    
    init(with article: Article) {
        self.article = article
    }
    
    var title: String {
        return article.title ?? "No Title"
    }
    
    var desciption: String {
        return article.description ?? "No Description"
    }
}
