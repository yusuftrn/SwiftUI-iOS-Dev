//
//  OrderListView.swift
//  CoffeeOrder
//
//  Created by Yusuf Turan on 17.05.2021.
//

import SwiftUI

struct OrderListView: View {
  
  let orders: [OrderViewModel]
  
  init(orders: [OrderViewModel]) {
    self.orders = orders
  }
  
  var body: some View {
    List {
      ForEach(self.orders, id:\.id) { order in
        HStack {
          Image(order.coffeeName)
            .resizable()
            .frame(width: 100, height: 100, alignment: .center)
            .clipShape(RoundedRectangle(cornerRadius: 16))
          VStack(alignment: .leading, spacing: 5) {
            Text(order.name)
              .font(.title)
              .padding([.leading, .bottom], 10)
            
            HStack {
              Text(order.coffeeName)
                .font(.footnote)
                .padding(5)
                .foregroundColor(.white)
                .background(Color.gray)
                .clipShape(RoundedRectangle(cornerRadius: 10))
              Spacer()
              Text(order.size)
                .font(.footnote)
                .padding(5)
                .background(Color.orange)
                .clipShape(RoundedRectangle(cornerRadius: 10))
              Spacer()
            }
          }
        }
      }
    }
  }
}

struct OrderListView_Previews: PreviewProvider {
  static var previews: some View {
    OrderListView(
      orders: [OrderViewModel(order: Order(name: "Mary", size: "Medium", coffeeName: "Regular", total: 3.0))])
  }
}
