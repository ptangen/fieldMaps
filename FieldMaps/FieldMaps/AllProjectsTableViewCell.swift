//
//  AllProjectsTableViewCell.swift
//  FieldMaps
//
//  Created by Paul Tangen on 2/8/17.
//  Copyright © 2017 Paul Tangen. All rights reserved.
//

import UIKit

class AllProjectsTableViewCell: UITableViewCell {

    var titleLabel = UILabel()
    var subTitleLabel = UILabel()
    let infoIconButton = UIButton()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
       
        //infoImage
        let infoImage = #imageLiteral(resourceName: "info")
        let infoImageView = UIImageView(image: infoImage.withRenderingMode(UIImageRenderingMode.alwaysTemplate))
        self.infoIconButton.setImage(infoImageView.image, for: .normal)
        self.infoIconButton.tintColor = UIColor.orange
        //self.infoIconButton.addTarget(self, action: #selector(self.onClickSignIn), for: UIControlEvents.touchUpInside)
        
        //titleLabel
        contentView.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.font = UIFont(name: "Helvetica Neue", size: CGFloat(18.0))
        
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
        titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -53).isActive = true
        
        //subTitleLabel
        contentView.addSubview(subTitleLabel)
        subTitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subTitleLabel.font = UIFont(name: "Helvetica Neue", size: CGFloat(12.0))
        
        subTitleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -4).isActive = true
        subTitleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        subTitleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -53).isActive = true
        
        //infoIcon
        contentView.addSubview(self.infoIconButton)
        self.infoIconButton.translatesAutoresizingMaskIntoConstraints = false
        self.infoIconButton.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0).isActive = true
        self.infoIconButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -24).isActive = true
        self.infoIconButton.heightAnchor.constraint(equalToConstant: 48).isActive = true
        self.infoIconButton.widthAnchor.constraint(equalToConstant: 48).isActive = true
    }
}
