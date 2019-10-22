//
//  TalkTableViewCell.swift
//  Pashiri
//
//  Created by TAKUMA NAKAMURA on 2019/08/20.
//  Copyright © 2019 NakamuraTakuma. All rights reserved.
//

import UIKit

class TalkTableViewCell: UITableViewCell {
    
    
    @IBOutlet var talkTextView:UILabel!
    @IBOutlet var dateLabel:UILabel!
    @IBOutlet var userLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
