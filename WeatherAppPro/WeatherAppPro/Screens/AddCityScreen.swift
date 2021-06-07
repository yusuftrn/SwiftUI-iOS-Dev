//
//  AddCityScreen.swift
//  WeatherAppSwiftUI
//
//  Created by Yusuf Turan on 3.06.2021.
//

import SwiftUI

struct AddCityScreen: View {
  
  @Environment(\.presentationMode) private var presentationMode
  @EnvironmentObject var store: Store
  @StateObject private var addWeatherVM = AddWeatherViewModel()
  var body: some View {
    
    VStack {
      VStack(spacing: 20) {
        TextField("Enter city", text: $addWeatherVM.city)
          .textFieldStyle(RoundedBorderTextFieldStyle())
        Button("Save") {
          addWeatherVM.save { weather in
            store.addWeather(weather)
            presentationMode.wrappedValue.dismiss()
          }
        }.padding(10)
        .frame(maxWidth: UIScreen.main.bounds.width/4)
        .foregroundColor(Color.white)
        .background(Color(#colorLiteral(red: 0.09019608051, green: 0, blue: 0.3019607961, alpha: 1)))
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
      }.padding()
      .frame(maxWidth: .infinity, maxHeight: 200)
      .background(Color(#colorLiteral(red: 1, green: 0.7956564272, blue: 0.8633865532, alpha: 1)))
      .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
      Spacer()
    }.padding()
    
    .navigationTitle("Add City")
    .embedInNavigationView()
  }
}

struct AddCityScreen_Previews: PreviewProvider {
  static var previews: some View {
    AddCityScreen()
      .environmentObject(Store())
  }
}
