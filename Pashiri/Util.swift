//
//  Util.swift
//  Pashiri
//
//  Created by TAKUMA NAKAMURA on 2019/08/19.
//  Copyright © 2019 NakamuraTakuma. All rights reserved.
//

import UIKit

class Util: NSObject {
    /**
     * 使用端末のディスプレイサイズを返す
     * @return displaySize (.width と .height)
     */
    class func returnDisplaySize() -> CGSize {
        let displaySize = UIScreen.main.bounds.size
        
        return displaySize
}
}
