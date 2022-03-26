//
//  NewsArticleViewModel.swift
//  StocksAppSwiftUI
//
//  Created by Julio Ismael Robles on 01/11/2021.
//

import Foundation

struct NewsArticleViewModel {
   
    let article: Article
    
    var imageURL: URL {
        guard let url = URL(string: self.article.imageURL) else {
            fatalError("no url found")
        }
        return url
    }
    
    var title: String {
        return self.article.title
    }
    
    var publication: String {
        return self.article.publication.uppercased()
    }
    
}
