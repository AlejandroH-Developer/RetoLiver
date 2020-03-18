//
//  ProductDataModel.swift
//  RetoLiver
//
//  Created by AlejandroH on 18/03/20.
//  Copyright © 2020 AlejandroH. All rights reserved.
//

import Foundation

struct ProductDataModel {
    let id: String
    let name: String
    let imageURL: String
    let listPrice: Double
    let promoPrice: Double
    
    var finalPrice: Double {
        
        if listPrice <= 0 || promoPrice <= 0 {
            return max(listPrice, promoPrice)
        }
        
        return min(listPrice, promoPrice)

    }
    
    var normalPrice: Double {
        let maximum: Double = max(max(listPrice, promoPrice), finalPrice)
        return maximum != finalPrice ? maximum : 0
    }
    
    
}
