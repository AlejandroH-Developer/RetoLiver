//
//  SearchHistoryPersistenceKeyedArchiverObjects.swift
//  RetoLiver
//
//  Created by AlejandroH on 17/03/20.
//  Copyright © 2020 AlejandroH. All rights reserved.
//

import Foundation

class SearchHistoryPersistence: NSObject, NSCoding {
    
    let data: SearchDataModel
    
    init(data: SearchDataModel) {
        self.data = data
    }
    
    required init?(coder: NSCoder) {
        let order: Int = coder.decodeInteger(forKey: "order")
        guard let text: String = coder.decodeObject(forKey: "text") as? String else { return nil }
        
        self.data = SearchDataModel(order: order, text: text)
        
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(data.order, forKey: "order")
        coder.encode(data.text, forKey: "text")
    }
    
}
