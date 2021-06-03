//
//  UserDefaults+Extensions.swift
//  WeatherAppSwiftUI
//
//  Created by Yusuf Turan on 3.06.2021.
//

import Foundation

extension UserDefaults {
    var unit: TemperatureUnit {
        guard let value = self.value(forKey: "unit") as? String else {
            return .kelvin
        }
        return TemperatureUnit(rawValue: value) ?? .kelvin
    }
}
