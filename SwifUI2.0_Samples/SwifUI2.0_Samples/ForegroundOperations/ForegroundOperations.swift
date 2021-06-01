//
//  ForegroundOperations.swift
//  SwifUI2.0_Samples
//
//  Created by Yusuf Turan on 1.06.2021.
//

import SwiftUI

struct ForegroundOperations: View {
  
  @State private var stockName: String = "ENE"
  @State private var stockPrice: Double?
  
  private func updateStockPrice() {
    stockPrice = Double.random(in: 0...1.0)
  }
  
  var body: some View {
    VStack {
      Text(self.stockName)
        .font(.largeTitle)
        .padding()
      Text(stockPrice != nil ? "$\(stockPrice!)" : "")
    }
    //on appear fires first time
    .onAppear {
      updateStockPrice()
    }
    //onReceive fires every view change. 
    .onReceive(NotificationCenter.default.publisher(for: UIApplication.willEnterForegroundNotification)) { _ in
      updateStockPrice()
    }

  }
}

struct ForegroundOperations_Previews: PreviewProvider {
  static var previews: some View {
    ForegroundOperations()
  }
}
