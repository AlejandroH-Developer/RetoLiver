//
//  UITextField+Placeholder.swift
//  RetoLiver
//
//  Created by AlejandroH on 17/03/20.
//  Copyright © 2020 AlejandroH. All rights reserved.
//

import UIKit

extension UITextField {
    
    @IBInspectable var placeholderColor: UIColor? {
        get{
            return self.placeholderColor
        }
        set {
            guard let newColor: UIColor = newValue else {
                return
            }
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder ?? "", attributes: [NSAttributedString.Key.foregroundColor: newColor])
        }
    }
    
}
