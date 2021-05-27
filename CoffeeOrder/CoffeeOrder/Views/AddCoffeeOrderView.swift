//
//  AddCoffeeOrderView.swift
//  CoffeeOrder
//
//  Created by Yusuf Turan on 17.05.2021.
//

import SwiftUI

struct AddCoffeeOrderView: View {
  
  @ObservedObject private var addCoffeeOrderVM = AddCoffeeOrderViewModel()
  @Binding var isPresented: Bool
  
  var body: some View {
    NavigationView {
      VStack {
        Form {
          Section(header: Text("Information").font(.body)) {
            TextField("Enter name", text: self.$addCoffeeOrderVM.name)
          }
          Section(header: Text("Select Coffee").font(.body)) {
            ForEach(addCoffeeOrderVM.coffeeList, id:\.name) { coffee in
              CoffeeCellView(coffee: coffee, selection: self.$addCoffeeOrderVM.coffeeName)
            }
          }
          Section(header: Text("Select Size").font(.body), footer: OrderTotalView(total: self.addCoffeeOrderVM.total)) {
            Picker("", selection: self.$addCoffeeOrderVM.size) {
              Text("Small").tag("Small")
              Text("Medium").tag("Medium")
              Text("Large").tag("Large")
            }
            .pickerStyle(SegmentedPickerStyle())
          }
          
          HStack(alignment: .center) {
            Button("Place Order") {
              self.addCoffeeOrderVM.placeOrder()
              self.isPresented = false
            }
          }
          .padding(EdgeInsets(top: 12, leading: 60, bottom: 12, trailing: 60))
          .foregroundColor(.white)
          .background(Color.green)
          .cornerRadius(10)
        }
      }
      .navigationBarTitle("Add Order")
    }
  }
}

struct AddCoffeeOrderView_Previews: PreviewProvider {
  static var previews: some View {
    AddCoffeeOrderView(isPresented: .constant(false))
      .previewDevice("iPhone 11 Pro")
  }
}

struct CoffeeCellView: View {
  
  let coffee: CoffeeViewModel
  @Binding var selection: String
  
  var body: some View {
    HStack {
      Image(coffee.imageURL)
        .resizable()
        .frame(width: 100, height: 100, alignment: .center)
        .cornerRadius(16)
      Text(coffee.name)
        .font(.title2)
        .fontWeight(.regular)
      Spacer()
      Image(systemName: self.selection == self.coffee.name ? "checkmark" : "")
        .padding()
    }
    .onTapGesture {
      self.selection = self.coffee.name
    }
  }
}
