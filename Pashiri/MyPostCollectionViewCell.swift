//
//  MyPostCollectionViewCell.swift
//  Pashiri
//
//  Created by TAKUMA NAKAMURA on 2019/08/19.
//  Copyright © 2019 NakamuraTakuma. All rights reserved.
//

import UIKit

class MyPostCollectionViewCell: UICollectionViewCell {

    @IBOutlet var userNameLabel : UILabel!
    @IBOutlet var titleLabel : UILabel!
    @IBOutlet var timeLabel : UILabel!
    @IBOutlet var dateLabel : UILabel!
    @IBOutlet var likeLabel : UILabel!
    @IBOutlet var unLikeLabel : UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func update(order: Order) {
        self.titleLabel.text = order.title
//        self.userNameLabel.text = order.name
        self.timeLabel.text = order.time
        self.dateLabel.text = order.updatedAt
    }
}
