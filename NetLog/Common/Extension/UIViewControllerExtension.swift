//
//  UIViewControllerExtension.swift
//  NetLog
//
//  Created by ENES AKSOY on 20.02.2021.
//  Copyright © 2021 Enes Aksoy. All rights reserved.
//

import UIKit


extension UIViewController {
    func createAlert(message: String, title: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let buttonTitle = NSLocalizedString("AlertButtonTitle", comment: "")
        let OKAction = UIAlertAction(title: buttonTitle, style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
