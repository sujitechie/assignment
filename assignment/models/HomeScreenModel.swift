//
//  HomeScreenModel.swift
//  assignment
//
//  Created by Sujith Peeka on 25/04/20.
//  Copyright © 2020 Sujith Peeka. All rights reserved.
//

import Foundation

class HomeScreen: Codable {
    let title: String?
    let facts: [Fact]
    private enum CodingKeys: String, CodingKey {
        case title
        case facts = "rows"
    }
    init() {
        title = ""
        facts = []
    }
}
