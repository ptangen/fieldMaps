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

        // Do any additional setup after loading the view.
    }
    
    override func loadView(){
        self.infoViewInst.frame = CGRect.zero
        self.view = self.infoViewInst
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Project"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
