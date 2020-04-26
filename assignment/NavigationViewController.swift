//
//  NavigationViewController.swift
//  assignment
//
//  Created by Sujith Peeka on 21/04/20.
//  Copyright © 2020 Sujith Peeka. All rights reserved.
//

import UIKit

class NavigationViewController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let homeScreenVC = HomeScreenViewController()
        self.viewControllers = [homeScreenVC]
    }
}
