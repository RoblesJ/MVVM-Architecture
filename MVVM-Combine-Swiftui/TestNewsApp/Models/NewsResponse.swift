//
//  NewsResponse.swift
//  TestNewsApp
//
//  Created by Julio Ismael Robles on 13/08/2021.
//

import Foundation

// MARK: - NewsResponse
struct NewsResponse: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable {
    let id = UUID()
    let author: String?
    let url: String?
    let source, title: String?
    let articleDescription: String?
    let image: String?
    let date: Date?

    enum CodingKeys: String, CodingKey {
        case author, url, source, title, image, date
        case articleDescription = "description"
    }
}

extension Article {
    /*
     "author": "Wilson Wong",
                 "url": "https://www.nbcnews.com/news/us-news/parent-attacks-teacher-after-mask-dispute-first-day-school-california-n1276736",
                 "source": "NBC News",
                 "title": "Parent attacks teacher after mask dispute on first day of school in California district, official says - NBC News",
                 "description": "The incident occurred about an hour after the first day of school started at Sutter Creek Elementary School in the Amador County Unified School District.",
                 "image": "https://media-cldnry.s-nbcnews.com/image/upload/t_nbcnews-fp-1200-630,f_auto,q_auto:best/newscms/2021_32/3498847/210813-sutter-creek-elementary-mn-0755.jpg",
                 "date": "2021-08-13T11:41:00Z"
     */
    static var dummyData: Article {
        .init(author: "Wilson Wong",
              url: "https://www.nbcnews.com/news/us-news/parent-attacks-teacher-after-mask-dispute-first-day-school-california-n1276736",
              source: "NBC News",
              title: "Parent attacks teacher after mask dispute on first day of school in California district, official says - NBC News",
              articleDescription: "The incident occurred about an hour after the first day of school started at Sutter Creek Elementary School in the Amador County Unified School District.",
              image: "https://media-cldnry.s-nbcnews.com/image/upload/t_nbcnews-fp-1200-630,f_auto,q_auto:best/newscms/2021_32/3498847/210813-sutter-creek-elementary-mn-0755.jpg",
              date: Date())
    }
}
