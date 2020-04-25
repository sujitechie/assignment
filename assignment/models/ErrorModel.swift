//
//  ErrorModel.swift
//  assignment
//
//  Created by Sujith Peeka on 24/04/20.
//  Copyright © 2020 Sujith Peeka. All rights reserved.
//

import Foundation

class CustomError: NSObject {
    var errorCode: Int?
    var errorDescription: String?

    init(code: Int, description: String) {
        errorCode = code
        errorDescription = description
    }
}
