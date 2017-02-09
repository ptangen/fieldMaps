//
//  InfoViewController.swift
//  FieldMaps
//
//  Created by Paul Tangen on 2/8/17.
//  Copyright © 2017 Paul Tangen. All rights reserved.
//

import UIKit

class InfoViewController: UIViewController {
    
    var infoViewInst = InfoView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.edgesForExtendedLayout = []   // prevents view from siding under nav bar
        // Do any additional setup after loading the view.
        
        // create buttons for nav bar
        let cancelButton = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(onCancel))
        let doneButton = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(onDone))
        
        // set font size of nav bar buttons
        let labelFont: UIFont = UIFont(name: "HelveticaNeue", size: CGFloat(16.0))!
        let attributesTextNormal = [ NSFontAttributeName : labelFont ]
        doneButton.setTitleTextAttributes(attributesTextNormal, for: .normal)
        cancelButton.setTitleTextAttributes(attributesTextNormal, for: UIControlState.normal)
        doneButton.isEnabled = false
        
        // add buttons to nav bar
        navigationItem.leftBarButtonItem = cancelButton
        navigationItem.rightBarButtonItem = doneButton
    }
    
    func onCancel() {
        let allProjectsViewControllerInst = AllProjectsViewController()
        navigationController?.pushViewController(allProjectsViewControllerInst, animated: false) // show destination with nav bar
    }
    
    func onDone() {
        print("done")
    }
    
    override func loadView(){
        self.infoViewInst.frame = CGRect.zero
        self.view = self.infoViewInst
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Project"
        self.infoViewInst.drawMap()
        self.infoViewInst.getTableViewData()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let contentSize = self.infoViewInst.infoTableViewInst.contentSize.height
        self.infoViewInst.infoTableViewInst.heightAnchor.constraint(equalToConstant: contentSize).isActive = true
        self.infoViewInst.infoTableViewInst.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
