//
//  NetLogTextField.swift
//  NetLog
//
//  Created by ENES AKSOY on 20.02.2021.
//  Copyright © 2021 Enes Aksoy. All rights reserved.
//

import UIKit
import JVFloatLabeledTextField

class NetLogTextField: JVFloatLabeledTextField {
    
    @IBInspectable var localizablePlaceholderKey: String? = nil{
        didSet {
            if localizablePlaceholderKey != nil {
                let floatingTitle = NSLocalizedString(localizablePlaceholderKey!, comment: "")
                self.setPlaceholder(floatingTitle, floatingTitle: floatingTitle)
                self.tintColor = .lightGray
                self.textColor = .black
                self.borderStyle = .none
            }
        }
    }
}
