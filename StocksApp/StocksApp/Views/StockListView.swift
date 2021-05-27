//
//  StockListView.swift
//  StocksApp
//
//  Created by Yusuf Turan on 24.05.2021.
//

import SwiftUI

struct StockListView: View {
  let stocks: [StockViewModel]
  var body: some View {
    List(self.stocks, id:\.symbol) { stock in
      StockCellView(stock: stock)
    }
  }
}

struct StockCellView: View {
  let stock: StockViewModel
  var body: some View {
    return  HStack {
      VStack(alignment: .leading) {
        Text(stock.symbol)
          .font(.custom("Arial", size: 22))
          .fontWeight(.bold)
          .foregroundColor(.white)
          .padding(EdgeInsets(top: 0, leading: 0, bottom: 5, trailing: 0))
        Text(stock.description)
          .font(.custom("Arial", size: 18))
          .foregroundColor(.secondary)
      }
      Spacer()
      VStack {
        Text("\(stock.price)")
          .foregroundColor(.white)
          .font(.custom("Arial", size: 22))
        Button(stock.change) {
          
        }
        .frame(width: 75)
        .padding(5)
        .background(Color.red)
        .foregroundColor(.white)
        .cornerRadius(6)
      }
    }
    .padding(10)
    .background(Color(red: 27/255, green: 28/255, blue: 30/255))
    .cornerRadius(20)
    
  }
}

struct StockListView_Previews: PreviewProvider {
  static var previews: some View {
    let stock = Stock(symbol: "GOOG", description: "Google Stocks", price: 1200, change: "+0.23")
    StockListView(stocks: [StockViewModel(stock: stock)])
  }
}
