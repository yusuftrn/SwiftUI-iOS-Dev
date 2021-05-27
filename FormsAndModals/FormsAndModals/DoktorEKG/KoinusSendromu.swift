//
//  KoinusSendromu.swift
//  FormsAndModals
//
//  Created by Yusuf Turan on 18.05.2021.
//

import Foundation


// MARK: - CoinusSyndrome
struct CoinusSyndrome: Codable {
    let title, definition, syndromeTypes, anomalies: String?
    let anomalylink: [String]?
    let references: String?
}

