//
//  ProductObjectParser.swift
//  RetoLiver
//
//  Created by AlejandroH on 18/03/20.
//  Copyright © 2020 AlejandroH. All rights reserved.
//

import Foundation

class ProductObjectParser {
    
    static func parse(dic: [String:Any]) -> ProductDataModel? {
        
        guard let id: String = dic["productId"] as? String else {
            print("Error productId")
            return nil
        }
        
        guard let name: String = dic["productDisplayName"] as? String else {
            print("Error productDisplayName")
            return nil
        }
        
        guard let imageURL: String = dic["smImage"] as? String else {
            print("Error smImage")
            return nil
        }
        
        guard let listPrice: Double = dic["listPrice"] as? Double else {
            print("Error listPrice")
            return nil
        }
        
        guard let promoPrice: Double = dic["promoPrice"] as? Double else {
            print("Error promoPrice")
            return nil
        }
        
        
        return ProductDataModel(id: id, name: name, imageURL: imageURL, listPrice: listPrice, promoPrice: promoPrice)
        
        
    }
    
    
}
