//
//  ContentView.swift
//  WeatherApp
//
//  Created by Yusuf Turan on 16.05.2021.
//

import SwiftUI

struct ContentView: View {
  @ObservedObject var weatherVM: WeatherViewModel
  init() {
    self.weatherVM = WeatherViewModel()
  }
  var body: some View {
    VStack(alignment: .center) {
      TextField("Enter city name", text: self.$weatherVM.cityName, onCommit:  {
        self.weatherVM.search()
      })
      .opacity(0.7)
      .multilineTextAlignment(.center)
      .font(.system(size: 50, design: .rounded))
      .padding()
      
      Text(self.weatherVM.temperature+"°C")
        .multilineTextAlignment(.center)
        .font(.system(size: 40, design: .rounded))
        .foregroundColor(Color.white)
        .padding()
        
    }
    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
    .background(Color.orange)
    .ignoresSafeArea(.all)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
