//
//  PLPDataDummy.swift
//  RetoLiver
//
//  Created by AlejandroH on 18/03/20.
//  Copyright © 2020 AlejandroH. All rights reserved.
//

import Foundation

class PLPDataDummy: PLPDataProtocol {
    
    func getPLP(criteria: String, completion: @escaping ((PLPDataResult) -> ())) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        
            let product1: ProductDataModel = ProductDataModel(id: "1091003275",
                                                              name: "Consola Xbox One S 1 TB + Star Wars Jedi: Fallen Order Deluxe Edition + 1 Mes EA Access",
                                                              imageURL: "https://ss423.liverpool.com.mx/sm/1091003275.jpg",
                                                              listPrice: 7759,
                                                              promoPrice: 6983.1)
            
            
            let product2: ProductDataModel = ProductDataModel(id: "1090904619",
                                                              name: "Consola PlayStation 4 Pro Fortnite 1 TB",
                                                              imageURL: "https://ss423.liverpool.com.mx/sm/1090904619.jpg",
                                                              listPrice: 10999,
                                                              promoPrice: 7991.1)
            
            
            let product3: ProductDataModel = ProductDataModel(id: "1095013984",
                                                              name: "Consola PS4 Sony PlayStation 4 3004132 1TB Bundle God of War Horizon Zero Dawn",
                                                              imageURL: "https://ss423.liverpool.com.mx/sm/1095013984.jpg",
                                                              listPrice: 7999,
                                                              promoPrice: 7999)
            
            
            let product4: ProductDataModel = ProductDataModel(id: "1095456851",
                                                              name: "Figura Funko Pop! Sonic the Hedgehog Shadow Vinyl Figure",
                                                              imageURL: "https://ss423.liverpool.com.mx/sm/1095456851.jpg",
                                                              listPrice: 699,
                                                              promoPrice: 699)
            
            
            let product5: ProductDataModel = ProductDataModel(id: "1093023648",
                                                              name: "Figura de Colección Iron Spider POP! Avengers end Game",
                                                              imageURL: "https://ss423.liverpool.com.mx/sm/1093023648.jpg",
                                                              listPrice: 299,
                                                              promoPrice: 0)
            
            completion(.successful(products: [product1, product2, product3, product4, product5]))
            
            //completion(.failure(message: "Hubo un error al cargar datos"))
            
        }
        
    }
    
}
