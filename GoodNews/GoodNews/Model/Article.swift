//
//  Article.swift
//  GoodNews
//
//  Created by Julio Ismael Robles on 26/10/2021.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
    
}
