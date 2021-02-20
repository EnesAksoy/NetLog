//
//  NetLogButton.swift
//  NetLog
//
//  Created by ENES AKSOY on 20.02.2021.
//  Copyright © 2021 Enes Aksoy. All rights reserved.
//

import UIKit

class NetLogButton: UIButton {
    
    @IBInspectable var localizablePlaceholderKey: String? = nil{
        didSet {
            if localizablePlaceholderKey != nil {
                self.setTitle(NSLocalizedString(localizablePlaceholderKey!, comment: ""), for: .normal)
            }
        }
    }
    
    @IBInspectable var circleButton: Bool = false {
        didSet {
            if circleButton == true {
                self.layer.cornerRadius = self.frame.size.width / 2
                self.layer.masksToBounds = true
            }
        }
    }
}
