//
//  EvaluationViewController.swift
//  Pashiri
//
//  Created by TAKUMA NAKAMURA on 2019/08/19.
//  Copyright © 2019 NakamuraTakuma. All rights reserved.
//

import UIKit

class EvaluationViewController: UIViewController {
    
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var unLikeButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    
    @IBAction func didTapLikeButton(){
//        navigationController?.popToViewController(TimeLineViewController.self, animated: true)
        self.tabBarController?.selectedIndex = 0
        
    }
    @IBAction func didTapUnLikeButton(){
        
    }

}
