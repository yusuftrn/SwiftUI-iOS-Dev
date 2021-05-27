//
// Created by Yusuf Turan on 16.03.2021.
// Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
// 

import SwiftUI

struct GalleryView: View {

  let animals: [Animal] = Bundle.main.decode("animals.json")
  //for haptic feedback
  let haptics = UIImpactFeedbackGenerator(style: .medium)

  @State private var selectedAnimal: String = "lion"

  // Dynamic Grid Layout:
  @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
  @State private var gridColumn: Double = 3.0

  private func gridSwitch() {
    gridLayout = Array(repeating: .init(.flexible()), count: Int(gridColumn))
  }

  // Efficient static Grid
  //let gridLayout: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)

  var body: some View {
    ScrollView(.vertical, showsIndicators: false) {
      VStack(alignment: .center, spacing: 30) {

        Image(selectedAnimal)
          .resizable()
          .scaledToFit()
          .clipShape(Circle())
          .overlay(Circle().stroke(Color.white, lineWidth: 8))

        Slider(value: $gridColumn, in: 2...4, step: 1)
          .padding(.horizontal)
          .onChange(of: gridColumn, perform: { value in
            gridSwitch()
          })

        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
          ForEach(animals) { item in
            Image(item.image)
              .resizable()
              .scaledToFit()
              .clipShape(Circle())
              .overlay(Circle().stroke(Color.white, lineWidth: 1))
              .onTapGesture {
                selectedAnimal = item.image
                haptics.impactOccurred()
              }
          }
        }
        .animation(.easeIn)
        .onAppear(perform: {
          gridSwitch()
        })
      }
      .padding(.horizontal, 10)
      .padding(.vertical, 50)
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(MotionAnimationView())
  }
}

struct GalleryView_Previews: PreviewProvider {
  static var previews: some View {
    GalleryView()
  }
}
