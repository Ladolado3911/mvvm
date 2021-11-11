//
//  Articles.swift
//  GoodNews
//
//  Created by Lado Tsivtsivadze on 11/5/21.
//

import Foundation

struct Response: Decodable {
    var articles: [Article]?
}

struct Article: Decodable {
    var title: String?
    var description: String?
}
