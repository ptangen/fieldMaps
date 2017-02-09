//
//  AllProjectsViewController.swift
//  FieldMaps
//
//  Created by Paul Tangen on 2/8/17.
//  Copyright © 2017 Paul Tangen. All rights reserved.
//

import UIKit

class AllProjectsViewController: UIViewController, AllProjectsViewDelegate {
    
    var allProjectsViewInst = AllProjectsView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.allProjectsViewInst.delegate = self
        self.edgesForExtendedLayout = []   // prevents view from siding under nav bar
    }
    
    override func loadView(){
        self.allProjectsViewInst.frame = CGRect.zero
        self.view = self.allProjectsViewInst
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "NEWFORMA"
        self.navigationItem.setHidesBackButton(true, animated: false)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let contentSize = self.allProjectsViewInst.allProjectsTableViewInst.contentSize.height
        self.allProjectsViewInst.allProjectsTableViewInst.heightAnchor.constraint(equalToConstant: contentSize).isActive = true
        self.allProjectsViewInst.allProjectsTableViewInst.reloadData()
    }
    
    func openInfoView(project: Project) {
        let infoViewControllerInst = InfoViewController()
        infoViewControllerInst.infoViewInst.selectedProject = project
        navigationController?.pushViewController(infoViewControllerInst, animated: false) // show destination with nav bar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

