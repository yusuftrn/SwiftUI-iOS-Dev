//
//  ContentView.swift
//  StocksApp
//
//  Created by Yusuf Turan on 20.05.2021.
//

import SwiftUI

struct ContentView: View {
  
  @State private var searchTerm: String = ""
  @ObservedObject private var stockListVM = StockListViewModel()
  init() {
    UINavigationBar.appearance().backgroundColor = UIColor.black
    UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
    UITableView.appearance().backgroundColor = UIColor.black
    UITableViewCell.appearance().backgroundColor = UIColor.black
    stockListVM.load()
  }
  
  var body: some View {
    let filteredStocks = self.stockListVM.searchTerm.isEmpty ?
      self.stockListVM.stocks :
      self.stockListVM.stocks.filter {
        $0.symbol.lowercased().starts(with: self.stockListVM.searchTerm.lowercased() )
      }
    VStack {
      NavigationView {
        ZStack(alignment: .leading) {
          Color.black
          
          SearchView(searchTerm: self.$stockListVM.searchTerm)
            .offset(y: -320)
          
          StockListView(stocks: filteredStocks)
            .offset(y: 150)
          
          NewsArticleView(newsArticles: self.stockListVM.news)
            .offset(y: 500)
          
        }
        .navigationBarTitle("Stocks")
      }
    }
    .padding(10)
    .edgesIgnoringSafeArea(.all)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
