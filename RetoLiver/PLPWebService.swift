//
//  PLPWebService.swift
//  RetoLiver
//
//  Created by AlejandroH on 18/03/20.
//  Copyright © 2020 AlejandroH. All rights reserved.
//

import Foundation
import Alamofire

class PLPWebService: PLPDataProtocol {
    
    func getPLP(criteria: String, completion: @escaping ((PLPDataResult) -> ())) {
        
        // Endpoint
        let original: String = "https://shoppapp.liverpool.com.mx/appclienteservices/services/v3/plp?search-string=" + criteria
        
        guard let endpoint: String = original.addingPercentEncoding(withAllowedCharacters: .urlFragmentAllowed) else {
            completion(.failure(message: "Error en url"))
            return
        }
        
        
        // Request
        Alamofire.request(endpoint, method: .get, parameters: [:]).validate().responseJSON { response in
            
            guard response.result.isSuccess else {
                print("Error")
                completion(.failure(message: "Hubo un error 1"))
                return
            }
            
            guard let value = response.result.value as? [String:Any] else {
                print("Error")
                completion(.failure(message: "Hubo un error 2"))
                return
            }
            
            guard let results = value["plpResults"] as? [String:Any] else {
                print("Error")
                completion(.failure(message: "Hubo un error 3"))
                return
            }
            
            guard let records = results["records"] as? [[String:Any]] else {
                print("Error")
                completion(.failure(message: "Hubo un error 4"))
                return
            }
            
            var products: [ProductDataModel] = []
            
            for dic in records {
                if let product: ProductDataModel = ProductObjectParser.parse(dic: dic) {
                    products.append(product)
                }
            }
            
            completion(.successful(products: products))
            
            
        }
        
        
    }
    
    
}
