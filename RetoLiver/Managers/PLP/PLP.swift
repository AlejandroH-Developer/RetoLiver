//
//  PLP.swift
//  RetoLiver
//
//  Created by AlejandroH on 18/03/20.
//  Copyright © 2020 AlejandroH. All rights reserved.
//

import Foundation

// MARK: - Results

enum PLPResult {
    case success(products: [ProductDataModel])
    case fail(message: String)
}


// MARK: - Class

class PLP {
    
    // Properties
    private let data: PLPDataProtocol
    private var products: [ProductDataModel] = []
    
    init() {
        data = PLPDataDummy()
    }
    
}


// MARK: - Methods

extension PLP {
    
    func getProducts(completion: @escaping ((_ result: PLPResult) -> ())) {
        
        if !products.isEmpty {
            completion(.success(products: products))
            return
        }
        
        data.getPLP { (result) in
            
            switch result {
                
            case .successful(let products):
                completion(.success(products: products))
                
            case .failure(let message):
                completion(.fail(message: message))
            
            }
            
        }
        
    }
    
}
