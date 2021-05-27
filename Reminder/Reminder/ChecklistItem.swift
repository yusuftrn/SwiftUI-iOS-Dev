//
// Created by Yusuf Turan on 12.03.2021.
// Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
// 

import Foundation

struct ChecklistItem: Identifiable, Codable {
	let id = UUID()
	var name: String
	var isChecked: Bool = false
}
