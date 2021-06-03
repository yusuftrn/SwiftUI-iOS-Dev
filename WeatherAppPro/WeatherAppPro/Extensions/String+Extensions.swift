//
//  String+Extensions.swift
//  WeatherAppSwiftUI
//
//  Created by Yusuf Turan on 3.06.2021.
//

import Foundation

extension String {
    func escaped() -> String {
        return self.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self 
    }
}
