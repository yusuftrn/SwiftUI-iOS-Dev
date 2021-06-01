//
//  ListModel.swift
//  SwifUI2.0_Samples
//
//  Created by Yusuf Turan on 1.06.2021.
//

import Foundation

struct ListItem: Identifiable {
    let id: UUID = UUID()
    let name: String
    var items: [ListItem]?
}

extension ListItem {
    static func all() -> [ListItem] {
        let animals = [ListItem(name: "🐶"), ListItem(name: "🐰")]
        let fruits = [ListItem(name: "🍑"), ListItem(name: "🍉"), ListItem(name: "🍌")]
        let cars = [ListItem(name: "🚗"), ListItem(name: "🚕"), ListItem(name: "🚙"), ListItem(name: "🚌"), ListItem(name: "🏎")]
                
        return [
          ListItem(name: "Animals", items: animals),
          ListItem(name: "Fruits", items: fruits),
          ListItem(name: "Vehicles", items: cars)
        ]
    }
}
