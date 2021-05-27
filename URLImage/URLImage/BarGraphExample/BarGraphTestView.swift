//
//  BarGraphTestView.swift
//  URLImage
//
//  Created by Yusuf Turan on 17.05.2021.
//

import SwiftUI

struct BarGraphTestView: View {
  var body: some View {
    BarGraph(reports: Report.all())
  }
}

struct BarGraphTestView_Previews: PreviewProvider {
  static var previews: some View {
    BarGraphTestView()
  }
}
