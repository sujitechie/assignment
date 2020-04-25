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
        
        configureView()
        fetchFacts()

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
    
    private func fetchFacts() {
        let url = "https://dl.dropboxusercontent.com/s/2iodh4vg0eortkl/facts.json"
        dataFactory.getFacts(url: url) { (data, error) in
            self.factsData = data!
              DispatchQueue.main.async {
                self.title = data?.title
                self.factsTable.reloadData()
                //let timer = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(self.reloadTable), userInfo: nil, repeats: false)

            }
        }
    }
//    @objc func reloadTable() {
//               DispatchQueue.main.async {
//                 self.factsTable.reloadData()
//             }
//    }

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
        return cell
    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return autodim
//    }

}
