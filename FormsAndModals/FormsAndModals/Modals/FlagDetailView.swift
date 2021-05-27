//
//  FlagDetailView.swift
//  FormsAndModals
//
//  Created by Yusuf Turan on 18.05.2021.
//

import SwiftUI

struct FlagDetailView: View {
  
  //@Environment(\.presentationMode) var presentationMode
  @Binding var flagVM: FlagViewModel
  
  var body: some View {
    VStack {
      Text(self.flagVM.flag)
        .font(.system(size: 200))
      TextField("Add country name:", text: self.$flagVM.country)
        .padding()
        .font(.system(size: 22, design: .rounded))
        .fixedSize()
      
      Button {
        //self.presentationMode.wrappedValue.dismiss()
        self.flagVM.showModal.toggle()
      } label: {
        Text("Submit")
          .padding()
          .frame(width: 120, height: 30, alignment: .center)
          .font(.system(size: 16, design: .rounded))
          .foregroundColor(.white)
          .background(RoundedRectangle(cornerRadius: 10))
      }
    }
  }
}

struct FlagDetailView_Previews: PreviewProvider {
  static var previews: some View {
    FlagDetailView(flagVM: .constant(FlagViewModel()))
  }
}
