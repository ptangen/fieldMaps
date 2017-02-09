//
//  AllProjectsView.swift
//  FieldMaps
//
//  Created by Paul Tangen on 2/8/17.
//  Copyright © 2017 Paul Tangen. All rights reserved.
//

import UIKit

protocol AllProjectsViewDelegate: class {
    func openInfoView(project: Project)
}

class AllProjectsView: UIView, UITableViewDataSource, UITableViewDelegate {

    weak var delegate: AllProjectsViewDelegate?
    let allProjectsTableViewInst = UITableView()
    let tableViewLabel = UILabel()
    let project1 = Project(name: "Anderson - New Home", number: "314", location: "24 Summit Drive, Grantham, NH")
    let project2 = Project(name: "Jackson - Remodel", number: "791", location: "10 Slalom Drive, Grantham, NH")
    var projects = [Project]()

    override init(frame:CGRect){
        super.init(frame: frame)
        projects = [self.project1, project2]
        
        self.allProjectsTableViewInst.delegate = self
        self.allProjectsTableViewInst.dataSource = self
        self.allProjectsTableViewInst.register(AllProjectsTableViewCell.self, forCellReuseIdentifier: "prototype")
        let borderGray = UIColor(colorLiteralRed: 200/255, green: 200/255, blue: 200/255, alpha: 1.0)
        self.allProjectsTableViewInst.layer.borderWidth = 1.0;
        self.allProjectsTableViewInst.layer.borderColor = borderGray.cgColor;

        self.tableViewLabel.text = "PROJECTS"
        self.tableViewLabel.font = UIFont(name: "HelveticaNeue", size: CGFloat(12.0))
        let labelGray = UIColor(colorLiteralRed: 109/255, green: 109/255, blue: 109/255, alpha: 1.0)
        self.tableViewLabel.textColor = labelGray
        self.pageLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func pageLayout() {
        
        // tableViewLabel
        self.addSubview(self.tableViewLabel)
        self.tableViewLabel.translatesAutoresizingMaskIntoConstraints = false
        self.tableViewLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 30).isActive = true
        self.tableViewLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16).isActive = true
        
        // allProjectsTableViewInst
        self.addSubview(self.allProjectsTableViewInst)
        self.allProjectsTableViewInst.translatesAutoresizingMaskIntoConstraints = false
        self.allProjectsTableViewInst.topAnchor.constraint(equalTo: self.topAnchor, constant: 48).isActive = true
        self.allProjectsTableViewInst.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
        self.allProjectsTableViewInst.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        // height anchor set in the viewController
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.projects.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 56
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = AllProjectsTableViewCell(style: .default, reuseIdentifier: "prototype")
        cell.infoIconButton.addTarget(self, action: #selector(self.onClickInfoButton), for: UIControlEvents.touchUpInside)
        cell.infoIconButton.accessibilityLabel = String(indexPath.row)
        cell.selectionStyle = .none
        cell.titleLabel.text = self.projects[indexPath.row].name
        let subTitle = self.projects[indexPath.row].number
        cell.subTitleLabel.text = String(subTitle)
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        return cell
    }
    
    func onClickInfoButton(sender: UIButton) {
        if let row = sender.accessibilityLabel, let delegate = self.delegate {
            if let rowInt = Int(row) {
                delegate.openInfoView(project: self.projects[rowInt])
            }
        }
    }
}
