//
//  StockListViewModel.swift
//  StocksApp
//
//  Created by Yusuf Turan on 20.05.2021.
//

import Foundation

class StockListViewModel: ObservableObject {
  
  @Published var searchTerm: String = ""
  @Published var stocks: [StockViewModel] = [StockViewModel]()
  @Published var news: [NewsArticleViewModel] = [NewsArticleViewModel]()
  
  func load() {
    fetchNews()
    fetchStocks()
  }
  
  private func fetchNews() {
    WebService().getTopNews { news in
      if let news = news {
        DispatchQueue.main.async {
          self.news = news.map(NewsArticleViewModel.init)
        }
      }
    }
  }
  
  private func fetchStocks() {
    WebService().getStocks { stocks in
      if let stocks = stocks {
        DispatchQueue.main.async {
          self.stocks = stocks.map(StockViewModel.init)
        }
      }
    }
  }
  
}
