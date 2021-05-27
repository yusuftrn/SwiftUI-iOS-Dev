//
// Created by Yusuf Turan on 24.03.2021.
// Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
// 

import SwiftUI

struct CreditsView: View {
    var body: some View {
      VStack {
        Image("compass")
          .resizable()
          .scaledToFit()
          .frame(width: 128, height: 128)

        Text("""
        Copyright © Yusuf Tyraen
        All right reserved.
      """)
          .font(.footnote)
          .multilineTextAlignment(.center)
      }
      .padding()
      .opacity(0.4)
    }
}

struct CreditsView_Previews: PreviewProvider {
    static var previews: some View {
        CreditsView()
          .previewLayout(.sizeThatFits)
          .padding()
    }
}
