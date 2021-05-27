//
//  ContentView.swift
//  CoffeeOrder
//
//  Created by Yusuf Turan on 17.05.2021.
//

import SwiftUI

struct ContentView: View {
  
  @State private var showModal: Bool = false
  @ObservedObject private var orderListVM = OrderListViewModel()
  
  var body: some View {
    NavigationView {
      VStack {
        OrderListView(orders: self.orderListVM.orders)
      }
      .navigationBarTitle("Coffee Shop Orders", displayMode: .inline)
      .navigationBarItems(
        leading:
          Button(action: reloadOrders) {
            Image(systemName: "arrow.clockwise")
              .foregroundColor(Color.primary)
          },
        trailing:
          Button(action: showAddCoffeeOrderView) {
            Image(systemName: "plus")
              .foregroundColor(Color.primary)
          }
      )
      .sheet(isPresented: self.$showModal) {
        AddCoffeeOrderView(isPresented: self.$showModal)
      }
    }
    .ignoresSafeArea(.all)
  }
  
  private func reloadOrders() {
    self.orderListVM.fetchOrders()
  }
  
  private func showAddCoffeeOrderView() {
    self.showModal.toggle()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
