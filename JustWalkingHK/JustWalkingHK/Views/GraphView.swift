//
//  GraphView.swift
//  JustWalkingHK
//
//  Created by Yusuf Turan on 1.06.2021.
//

import SwiftUI

struct GraphView: View {

  let steps: [Step]
  var totalSteps: Int {
    steps.map { $0.count }.reduce(0, +)
  }
  static let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "dd/MM"
    return formatter
  }()
  
  var body: some View {
    VStack {
      HStack(alignment: .lastTextBaseline) {
        ForEach(steps, id:\.id) { step in
          let yValue = Swift.min(step.count/20, 300)
          VStack {
            Text("\(step.count)")
              .font(.caption)
              .foregroundColor(.white)
            Rectangle()
              .fill(step.count > 5000 ? Color.green : Color.red)
              .frame(width: 20, height: CGFloat(yValue))
            Text("\(step.date, formatter:Self.dateFormatter)")
              .font(.caption)
              .foregroundColor(.white)
          }
        }
      }
      Text("Total Steps: \(totalSteps)")
        .padding(.top, 100)
        .foregroundColor(.white)
        .opacity(0.5)
      
    }.frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(Color.blue)
    .cornerRadius(10)
    .padding(10)
  }
}

struct GraphView_Previews: PreviewProvider {
  static var previews: some View {
    let steps = [
      Step(count: 3421, date: Date()),
      Step(count: 142, date: Date()),
      Step(count: 5232, date: Date()),
      Step(count: 1231, date: Date()),
      Step(count: 512, date: Date()),
    ]
    GraphView(steps: steps)
  }
}
