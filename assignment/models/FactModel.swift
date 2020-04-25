//
//  FactModel.swift
//  assignment
//
//  Created by Sujith Peeka on 24/04/20.
//  Copyright © 2020 Sujith Peeka. All rights reserved.
//

import Foundation

class Fact: Codable {
    let title: String?
    let description: String?
    let image: String?
    private enum CodingKeys: String, CodingKey {
        case title
        case description
        case image = "imageHref"
    }

//    override init() {
//        factTitle = ""
//        factDescription = ""
//        factImage = ""
//    }
//
//    init(title: String, description: String, image: String) {
//        factTitle = title
//        factDescription = description
//        factImage = image
//    }
}
