//
//  UIView+Utils.swift
//  RetoLiver
//
//  Created by AlejandroH on 18/03/20.
//  Copyright © 2020 AlejandroH. All rights reserved.
//

import UIKit

// MARK: - Appear & Disappear Methods

extension UIView {
    
    func appear(animated: Bool = true) {
        self.showView(true, animated: animated)
    }
    
    func disappear(animated: Bool = true) {
        self.showView(false, animated: animated)
    }
    
    fileprivate func showView(_ show: Bool, animated: Bool = true) {
        self.isHidden = false
        self.superview?.bringSubviewToFront(self)
        self.alpha = !show ? 1.0 : 0.0
        
        if !animated {
            self.alpha = show ? 1.0 : 0.0
            if !show {
                self.superview?.sendSubviewToBack(self)
            }
            return
        }
        
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = show ? 1.0 : 0.0
        }) { (finished) in
            if !show {
                self.superview?.sendSubviewToBack(self)
            }
        }
        
    }
    
}



// MARK: - Add subview

extension UIView {
    
    func addSubviewWithSameFrame(_ view:UIView) {
        view.translatesAutoresizingMaskIntoConstraints  = false
        addSubview(view)
        view.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        view.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        view.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
    
}

