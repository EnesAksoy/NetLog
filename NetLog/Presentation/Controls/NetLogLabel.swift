//
//  NetLogLabel.swift
//  NetLog
//
//  Created by ENES AKSOY on 20.02.2021.
//  Copyright © 2021 Enes Aksoy. All rights reserved.
//

import UIKit

class NetLogLabel: UILabel {
    
    @IBInspectable var localizablePlaceholderKey: String? = nil{
        didSet {
            if localizablePlaceholderKey != nil {
                self.text = NSLocalizedString(localizablePlaceholderKey!, comment: "")
            }
        }
    }
}
