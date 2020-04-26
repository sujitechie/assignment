//
//  ViewController.swift
//  assignment
//
//  Created by Sujith Peeka on 21/04/20.
//  Copyright © 2020 Sujith Peeka. All rights reserved.
//

import UIKit

class HomeScreenViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let factsTable = UITableView()
    let dataFactory = DataFactory()
    var factsData = HomeScreen()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        factsTable.dataSource = self
        factsTable.delegate = self
        factsTable.register(FactsTableCell.self, forCellReuseIdentifier: "factsCell")
        //configure View
        configureView()
        fetchFacts()
    }

    private func configureView() {
        view.backgroundColor = UIColor.white
        self.title = "Home"
        factsTable.backgroundColor = .white
        view.addSubview(factsTable)
        factsTable.pinToBounds(viewtoPin: view)
    }
    private func fetchFacts() {
        let url = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        dataFactory.getFacts(url: url) { (data, error) in
            if let error = error {
                print("Error : \(String(describing: error.errorDescription))")
            } else {
                if let factData = data {
                    self.factsData = factData
                      DispatchQueue.main.async {
                        self.title = factData.title
                        self.factsTable.reloadData()
                    }
                } else {
                    print("Error : something went wrong.")
                }
            }
        }
    }
    // MARK: Table View Delegate methods
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return factsData.facts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "factsCell", for: indexPath)
        guard let factsCell = cell as? FactsTableCell else {
            return FactsTableCell()
        }
        factsCell.title.text = factsData.facts[indexPath.row].title
        factsCell.factDescription.text = factsData.facts[indexPath.row].description
        if let imageUrl = factsData.facts[indexPath.row].image {
            factsCell.factImage.isHidden = false
            factsCell.loadImagefromURL(url: imageUrl)
        } else {
            factsCell.factImage.isHidden = true
        }
        return cell
    }
}
