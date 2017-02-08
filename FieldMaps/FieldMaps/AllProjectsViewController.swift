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
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func loadView(){
        self.allProjectsViewInst.frame = CGRect.zero
        self.view = self.allProjectsViewInst
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "NEWFORMA"
    }
    
    func openInfoView() {
        let infoViewControllerInst = InfoViewController()
        navigationController?.pushViewController(infoViewControllerInst, animated: false) // show destination with nav bar
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

