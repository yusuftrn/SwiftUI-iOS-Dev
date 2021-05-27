//
//  BarGraph.swift
//  URLImage
//
//  Created by Yusuf Turan on 17.05.2021.
//

import SwiftUI

struct BarGraph: View {
  
  var reports: [Report]
  
  var body: some View {
    VStack(alignment: .center) {
      HStack(alignment: .lastTextBaseline) {
        ForEach(self.reports, id:\.year) { report in
          BarView(report: report)
            .padding()
        }
        Spacer()
      }
    }
  }
}

struct BarView: View {
  
  let report: Report
  @State private var showGraph: Bool = false
  
  var body: some View {
    let value = report.revenue / 500
    let yValue = Swift.min(value * 20, 500)
    
    return VStack {
      Text(String(format: "$ %.2f", report.revenue))
      Rectangle()
        .fill(Color.red)
        .frame(width: 100, height: self.showGraph ? CGFloat(yValue) : 0)
        .onAppear {
          withAnimation(.spring()) {
            self.showGraph.toggle()
          }
        }
      Text(report.year)
    }
  }
}

struct BarGraph_Previews: PreviewProvider {
  static var previews: some View {
    BarGraph(reports: Report.all())
  }
}
