//
//  ViewController.swift
//  assignment
//
//  Created by Sujith Peeka on 21/04/20.
//  Copyright © 2020 Sujith Peeka. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var factsTable = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        factsTable.dataSource = self
        factsTable.delegate = self
        factsTable.register(factsTableCell.self, forCellReuseIdentifier: "factsCell")
        configureView()

    }
    
    private func configureView() {
        
        view.backgroundColor = UIColor.white
        self.title = "Home"
        factsTable.backgroundColor = .white
        view.addSubview(factsTable)
        factsTable.translatesAutoresizingMaskIntoConstraints = false
        factsTable.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        factsTable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        factsTable.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0).isActive = true
        factsTable.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0).isActive = true
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "factsCell", for: indexPath) as! factsTableCell
        cell.title.text = "custom cell"
        return cell
    }


}

