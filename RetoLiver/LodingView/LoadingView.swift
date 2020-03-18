//
//  LoadingView.swift
//  RetoLiver
//
//  Created by AlejandroH on 18/03/20.
//  Copyright © 2020 AlejandroH. All rights reserved.
//

import Foundation
import UIKit

class LoadingView: UIView {
    
    @IBOutlet weak var contentView: UIView!


    class func shared() -> LoadingView {
        struct Singleton {
            static let instance = LoadingView(frame: CGRect.zero)
        }
        return Singleton.instance
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUp()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUp()
    }
    
    private func setUp() {
        Bundle.main.loadNibNamed("LoadingView",owner:self,options:nil)
        addSubviewWithSameFrame(contentView)
    }
    
    
}
    


// MARK: - Presentation

extension LoadingView {
    
    func show() {
        alpha = 0.0
        let window = UIApplication.shared.windows.first(where: { $0.isKeyWindow })
        window?.addSubviewWithSameFrame(self)
        
        UIView.animate(withDuration: 0.15, animations: {
            self.alpha = 1.0
        })
    }
    
    
    func remove() {
        UIView.animate(withDuration: 0.15, animations: {
            self.alpha = 0.0
        }) { (bool) in
            self.removeFromSuperview()
        }
    }
    
}
