//
//  NewsArticleViewModel.swift
//  StocksApp
//
//  Created by Yusuf Turan on 24.05.2021.
//

import Foundation

struct NewsArticleViewModel {
  let article: Article
  
  var imageURL: String {
    return self.article.imageURL
  }
  var title: String {
    return self.article.title
  }
  var publication: String {
    return self.article.publication.uppercased()
  }
}
