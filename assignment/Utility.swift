//
//  utilities.swift
//  assignment
//
//  Created by Sujith Peeka on 26/04/20.
//  Copyright © 2020 Sujith Peeka. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func pinToBounds(viewtoPin: UIView) {
        self.translatesAutoresizingMaskIntoConstraints = false
        let constraints = [
            self.topAnchor.constraint(equalTo: viewtoPin.topAnchor, constant: 0),
            self.bottomAnchor.constraint(equalTo: viewtoPin.bottomAnchor, constant: 0),
            self.leftAnchor.constraint(equalTo: viewtoPin.leftAnchor, constant: 0),
            self.rightAnchor.constraint(equalTo: viewtoPin.rightAnchor, constant: 0)
        ]
        NSLayoutConstraint.activate(constraints)
    }
}
