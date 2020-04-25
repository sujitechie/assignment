//
//  factsTableCell.swift
//  assignment
//
//  Created by Sujith Peeka on 21/04/20.
//  Copyright © 2020 Sujith Peeka. All rights reserved.
//

import UIKit

class FactsTableCell: UITableViewCell {

    var title = UILabel()
    var factDescription = UILabel()
    var factImage = UIImage()

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
        
        self.addSubview(title)
        self.addSubview(factDescription)
        let imageView = UIImageView(image: factImage)
        self.addSubview(imageView)
        
        //Add constraints for Image
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .gray
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
        imageView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: -8).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        //Add constraints for Title
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        title.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        //title.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        title.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 8).isActive = true
        title.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        
        //Add constraints for description
        factDescription.translatesAutoresizingMaskIntoConstraints = false
        factDescription.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 8).isActive = true
        factDescription.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
        factDescription.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 8).isActive = true
        factDescription.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
        //factDescription.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    func loadImagefromURL(url: String) {
        
    }

}
