//
//  Note.swift
//  NotesForWatch WatchKit Extension
//
//  Created by Yusuf Turan on 7.06.2021.
//

import Foundation

struct Note: Identifiable, Codable {
  let id: UUID
  let text: String
}
