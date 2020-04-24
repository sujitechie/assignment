//
//  factsTableCell.swift
//  assignment
//
//  Created by Sujith Peeka on 21/04/20.
//  Copyright © 2020 Sujith Peeka. All rights reserved.
//

import UIKit

class factsTableCell: UITableViewCell {
    
    var title = UILabel()
    var factDescription = UILabel()
    var factImage = UIImage()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureCell()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
//    override func setSelected(_ selected: Bool, animated: Bool) {
//        super.setSelected(selected, animated: animated)
//
//        // Configure the view for the selected state
//    }
    
    private func configureCell() {
        self.addSubview(title)
        
        //Add constraints for Title
        title.translatesAutoresizingMaskIntoConstraints = false
        title.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        title.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        title.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        title.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
    }
    

}
