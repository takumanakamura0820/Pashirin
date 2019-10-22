//
//  ConfirmViewController.swift
//  Pashiri
//
//  Created by TAKUMA NAKAMURA on 2019/08/20.
//  Copyright © 2019 NakamuraTakuma. All rights reserved.
//

import UIKit

class ConfirmViewController: UIViewController {
    
    var titleName: String?
    var time: String?
    var detail:String?
    var coin:String?
    
    @IBOutlet var titleLabel:UILabel!
    
    @IBOutlet var timeLabel:UILabel!
    
    @IBOutlet var pashiriDetailTextView:UITextView!
    
    @IBOutlet var coinLabel:UILabel!
    
    @IBOutlet var pashiruButton:UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = titleName
        timeLabel.text = time
        pashiriDetailTextView.text = detail
        coinLabel.text = coin
    }
    

    @IBAction func didTapButton(){
        self.dismiss(animated: true, completion: nil)
        self.dismiss(animated: true, completion: nil)
        
    }
}
