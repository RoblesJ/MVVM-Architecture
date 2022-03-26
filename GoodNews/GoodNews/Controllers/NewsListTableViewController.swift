//
//  NewsListTableViewController.swift
//  GoodNews
//
//  Created by Julio Ismael Robles on 26/10/2021.
//

import Foundation
import UIKit


class NewsListTableViewController: UITableViewController {
    
    private var articleListVM: ArticleListViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    private func setup(){
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=b103bbbcebc24c588cec0a974aa6a7c6") else { return }
        
        WebService().getArticles(url: url) { articles in
            guard let articles = articles else { return }
            self.articleListVM = ArticleListViewModel(articles: articles)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListVM?.numberOfSections ?? 0
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM?.numberOfRowsInSection(section) ?? 1
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as? ArticleTableViewCell else {
            fatalError("ArticleTableViewCell not found")
        }
        let articleVM = self.articleListVM?.articleAtIndex(indexPath.row)
        cell.titleLabel.text = articleVM?.title
        cell.descriptionLabel.text = articleVM?.description
        
        return cell
        
        
    }
}
