//
//  View+Extensions.swift
//  WeatherAppSwiftUI
//
//  Created by Yusuf Turan on 3.06.2021.
//

import Foundation
import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        return NavigationView { self }
    }
}
