//
//  UIImageView+Utils.swift
//  RetoLiver
//
//  Created by AlejandroH on 18/03/20.
//  Copyright © 2020 AlejandroH. All rights reserved.
//

import Foundation
import UIKit
import AlamofireImage

extension UIImageView {
    
    func downloadImage(_ link: String) {
        let placeholder: UIImage? = UIImage(named: "list_placeholder")
        
        image = placeholder
        
        guard let url: URL = URL(string: link) else {
            image = placeholder
            return
        }
        
        af_setImage(withURL: url)
        
    }
    
}
