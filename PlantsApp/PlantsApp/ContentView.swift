//
//  ContentView.swift
//  PlantsApp
//
//
//

import SwiftUI

struct ContentView: View {
  var body: some View {
    ZStack {
      
      VStack(alignment: .leading) {
        
        HStack {
          Spacer()
          
          Image(systemName: "leaf")
            .font(.system(size: 40))
            .foregroundColor(.white)
            .padding()
            .background(Color(#colorLiteral(red: 0.2652368248, green: 0.946623981, blue: 0.6512340903, alpha: 1)))
            .cornerRadius(30)
          
          Text("Buy\nseeds")
            .font(.headline)
            .padding()
        }.frame(maxWidth: .infinity, maxHeight: 200)
        
        Text("Sansevieria")
          .font(.system(size: 46))
          .fontWeight(.bold)
          .padding([.leading], 10)
        Text("Autoflower")
          .font(.title)
          .opacity(0.5)
          .padding([.leading],10)
        Group {
          Text("Yield")
            .font(.system(size: 22))
            .opacity(0.5)
            .padding([.leading, .top])
          
          Text("450 gr")
            .font(.system(size: 30))
            .padding([.leading])
          
          Text("THC")
            .font(.system(size: 22))
            .opacity(0.5)
            .padding([.leading, .top])
          
          Text("14%")
            .font(.system(size: 30))
            .padding([.leading])
          
          Text("CBD")
            .font(.system(size: 22))
            .opacity(0.5)
            .padding([.leading, .top])
          
          Text("0.2 %")
            .font(.system(size: 30))
            .padding([.leading])
        }
        
        Group {
          Text("Flowering")
            .font(.system(size: 22))
            .opacity(0.5)
            .padding([.leading, .top])
          
          Text("6-8 weeks")
            .font(.system(size: 30))
            .padding([.leading])
          
          Text("Learn more")
            .font(.system(size: 30))
            .padding([.top, .leading])
        }
        
        Spacer()
        
        HStack {
          Spacer()
          Button("Next") {
            
          }.padding()
          .font(.system(size: 20))
          .foregroundColor(Color.black)
          .frame(width: 200, height: 100)
          .background(Color.white)
          .cornerRadius(50)
          
          .shadow(color: Color(#colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)), radius: 8, x: -8, y: 6)
          
        }.padding()
        
        
        Spacer()
        
        
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.9450977445, green: 0.9574689269, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.9106959701, green: 0.9534538388, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.8644073606, green: 0.926147759, blue: 0.9949653745, alpha: 1))]), startPoint: .top, endPoint: .bottom))
      .edgesIgnoringSafeArea(.all)
      
      
      
      Circle()
        .offset(x: 200, y: 50)
        .fill(LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 0.8583519459, green: 0.9101585746, blue: 0.9791455865, alpha: 1)), Color(#colorLiteral(red: 0.7383138537, green: 0.8278003335, blue: 0.948338449, alpha: 1))]), startPoint: .top, endPoint: .bottom))
      
      Image("plant")
        .resizable()
        .aspectRatio(contentMode: .fit)
        .offset(x: 180, y: -70)
      
    }
    
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
