//
//  Coinus Syndrome.swift
//  FormsAndModals
//
//  Created by Yusuf Turan on 18.05.2021.
//

import SwiftUI

struct CoinusSyndromeView: View {
  
  
  let anomalies: [String] = [
    "Sinüs bradikardisi",
    "Sinüs taşikardisi",
    "Atriyal fibrilasyon",
    "Nodal ritm", "ST segment çökmesi veya yükselmesi",
    "T dalgası inversiyonu veya düzleşmesi",
    "QRS genişlemesi",
    "Uzamış QT intervali",
    "Ventriküler aritmiler (sık VPS, ventriküler bigemine, ventriküler fibrilasyon)"
    ]
  
  var body: some View {
    NavigationView {
      VStack {
        Form {
          Section(header: Text("Hipersensitiviteye Bağlı Koroner Sendrom")) {
            Text("- Mast hücre aktivasyonunun görüldüğü durumlarla eşzamanlı olarak ortaya çıkan akut koroner sendromdur.\n\n- Kounis sendromunda anaflaksinin primer oluşum yeri ve hedefi kalptir.\n\n- Öte yandan Kounis sendromu, hipersensitivite miyokarditi değildir ve ayırımı yapılmalıdır.")
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
          }
          
          Section(header: Text("3 türü mevcuttur:")) {
            Text("Tip 1: Normal veya normale yakın koroner arterleri olan hastada koroner arter hastalığı için risk faktörleri yok iken akut allerjik atak ile beraber koroner arter spazmının ortaya çımasıdır. Bu sırada kardiyak enzimlerde yükselme olabilir veya olmayabilir.\n\nTip 2: Hastada sessiz ancak önceden var olan ateromatöz lezyonlar bulunur. Akut allerjik ataklar sırasında bu ateromatöz lezyonlarda koroner arter spazmı, plak erozyonu veya plak rüptürü gelişerek akut miyokard infarktüsüne yol açar.\n\nTip 3: İlaç kaplı stent implantasyonu ve stent trombozu sırasında gelişen hipersensitivite reaksiyonlarıdır.")
                .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
          }
          
          Section(header: Text("Görülebilen EKG Anormallikleri:")) {
            ForEach(0..<anomalies.count) { index in
              Text(anomalies[index])
                  .font(.subheadline)
                .frame(maxWidth: .infinity, alignment: .leading)
            }
          }
          
          Section(header: Text("Referanslar:")) {
            Text("-Future Cardiol 2011;7:805-824.\n-Can J Cardiol 2002;18:508-511.\n-Int J Cardiol 2010;145:553.")
              .font(.footnote)
              .frame(maxWidth: .infinity, alignment: .leading)
          }
        }
      }
      .navigationBarTitle("Kounis Sendromu", displayMode: .inline)
    }
  }
}

struct CoinusSyndromeView_Previews: PreviewProvider {
  static var previews: some View {
    CoinusSyndromeView()
  }
}
