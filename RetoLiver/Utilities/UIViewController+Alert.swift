//
//  UIViewController+Alert.swift
//  RetoLiver
//
//  Created by AlejandroH on 18/03/20.
//  Copyright © 2020 AlejandroH. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func showMessage(_ message: String, actionTitle: String, completion: (() -> ())? = nil) {
        let alert: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: actionTitle, style: .default, handler: { (_) in
            completion?()
        }))
        alert.view.tintColor = UIColor(named: "main_color")
        self.presentViewController(alert, animated: true)
    }
    
}
