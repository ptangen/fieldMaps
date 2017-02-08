//
//  InfoTableViewCell.swift
//  FieldMaps
//
//  Created by Paul Tangen on 2/8/17.
//  Copyright © 2017 Paul Tangen. All rights reserved.
//

import UIKit

class InfoTableViewCell: UITableViewCell {

    var labelLabel = UILabel()
    var valueLabel = UILabel()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //labelLabel
        contentView.addSubview(labelLabel)
        labelLabel.translatesAutoresizingMaskIntoConstraints = false
        labelLabel.font = UIFont(name: "Helvetica Neue", size: CGFloat(10.0))
        labelLabel.textColor = UIColor.gray
        
        labelLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        labelLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        labelLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -53).isActive = true
        
        //subTitleLabel
        contentView.addSubview(valueLabel)
        valueLabel.translatesAutoresizingMaskIntoConstraints = false
        valueLabel.font = UIFont(name: "Helvetica Neue", size: CGFloat(18.0))
        
        valueLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -6).isActive = true
        valueLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        valueLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -53).isActive = true
    }

}
