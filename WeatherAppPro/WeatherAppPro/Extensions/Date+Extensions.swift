//
//  Date+Extensions.swift
//  WeatherAppSwiftUI
//
//  Created by Yusuf Turan on 3.06.2021.
//

import Foundation

extension Date {
    func formatAsString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter.string(from: self)
    }
}
