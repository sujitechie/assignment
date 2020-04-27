//
//  factsTableCell.swift
//  assignment
//
//  Created by Sujith Peeka on 21/04/20.
//  Copyright © 2020 Sujith Peeka. All rights reserved.
//

import UIKit

class FactsTableCell: UITableViewCell {

    let title = UILabel()
    let factDescription = UILabel()
    let factImage = UIImageView()
    let padding: CGFloat = 8.0

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layoutView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func layoutView() {
        factDescription.numberOfLines = 0
        title.font = .systemFont(ofSize: 16, weight: .bold)
        //Add title, description, image to view
        self.addSubview(title)
        self.addSubview(factDescription)
        //let factImage = UIfactImage(image: factImage)
        self.addSubview(factImage)
        //Add constraints for factImage
        factImage.translatesAutoresizingMaskIntoConstraints = false
        factImage.topAnchor.constraint(equalTo: self.topAnchor, constant: padding).isActive = true
        factImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: padding).isActive = true
        factImage.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -padding).isActive = true
        factImage.widthAnchor.constraint(equalToConstant: 100).isActive = true
        factImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        //Add constraints for Title
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: self.topAnchor, constant: padding).isActive = true
        title.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -padding).isActive = true
        title.leftAnchor.constraint(equalTo: factImage.rightAnchor, constant: padding).isActive = true
        title.heightAnchor.constraint(equalToConstant: 20).isActive = true
        //Add constraints for description
        factDescription.translatesAutoresizingMaskIntoConstraints = false
        factDescription.topAnchor.constraint(equalTo: title.bottomAnchor, constant: padding).isActive = true
        factDescription.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -padding).isActive = true
        factDescription.leftAnchor.constraint(equalTo: factImage.rightAnchor, constant: padding).isActive = true
        factDescription.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -padding).isActive = true
    }
    func loadImagefromURL(url: String) {
        let dataFactory = DataFactory()
        dataFactory.downloadImageFromURL(imageUrl: url) { (image, error) in
            if let error = error {
                print("Error : \(String(describing: error.errorDescription))")
            } else {
                if let image = image {
                    print("success : image downloaded.")
                    DispatchQueue.main.async {
                        self.factImage.image = image
                    }
                } else {
                    print("Error : something went wrong.")
                }
            }
        }
    }
    override func prepareForReuse() {
        imageView?.image = nil
    }

}
