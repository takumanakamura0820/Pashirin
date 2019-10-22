//
//  DetailViewController.swift
//  Pashiri
//
//  Created by TAKUMA NAKAMURA on 2019/08/20.
//  Copyright © 2019 NakamuraTakuma. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var hikiukeruButton:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapHikiukeruButton(){
        self.tabBarController?.selectedIndex = 1
    }

}
