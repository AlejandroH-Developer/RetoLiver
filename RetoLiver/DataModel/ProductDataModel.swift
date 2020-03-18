//
//  ProductDataModel.swift
//  RetoLiver
//
//  Created by AlejandroH on 18/03/20.
//  Copyright © 2020 AlejandroH. All rights reserved.
//

import Foundation

enum PriceType {
    case list
    case promo
}


struct ProductDataModel {
    let id: String
    let name: String
    let imageURL: String
    let listPrice: Float
    let promoPrice: Float
    
    var priceType: PriceType {
        
        if listPrice <= 0 {
            return .promo
        }
        
        if promoPrice <= 0 {
            return .list
        }
        
        return listPrice >= promoPrice ? .list : .promo
        
    }
    
}
