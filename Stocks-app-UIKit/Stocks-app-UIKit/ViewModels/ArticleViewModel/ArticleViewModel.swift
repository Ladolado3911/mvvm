//
//  ArticleViewModel.swift
//  Stocks-app-UIKit
//
//  Created by Lado Tsivtsivadze on 11/11/21.
//

import Foundation
import UIKit

struct ArticleViewModel {
    
    let article: Article
    
    var title: String {
        article.title ?? "No Title"
    }
    
    var img: UIImage {
        guard let url = article.imageURL,
              let urlCasted = URL(string: url) else {
            return UIImage(named: "xmark.octagon")!
        }
        if let data = try? Data(contentsOf: urlCasted) {
            return UIImage(data: data)!
        }
        else {
            return UIImage(named: "xmark.octagon")!
        }
    }
    
    var publication: String {
        article.publication ?? "No Publication"
    }
}
