//
//  WebServices.swift
//  GoodNews
//
//  Created by Julio Ismael Robles on 26/10/2021.
//

import Foundation

class WebService {
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let decoder = JSONDecoder()
                let articleList = try? decoder.decode(ArticleList.self, from: data)
                if let articles = articleList?.articles {
                    completion(articles)
                }
                print(data)
            }
        }.resume()
    }
}
