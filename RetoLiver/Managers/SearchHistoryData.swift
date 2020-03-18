//
//  SearchHistoryData.swift
//  RetoLiver
//
//  Created by AlejandroH on 17/03/20.
//  Copyright © 2020 AlejandroH. All rights reserved.
//

import Foundation

class SearchHistoryData: SearchHistoryDataProtocol {
    
    // Properties
    static let shared: SearchHistoryData = SearchHistoryData()
    private let persistence: SearchHistoryPersistenceProtocol
    
    private var searches: [String]
    
    private init() {
        persistence = SearchHistoryKeyedArchiver()
        searches = []
        load()
    }
    
}


// MARK: - Persistence

private extension SearchHistoryData {
    
    func load() {
        let data = persistence.load()
        let sorted = data.sorted(by: { $0.order < $1.order }).map({$0.text})
        self.searches = sorted
    }
    
    func save() {
        var persistences: [SearchDataModel] = []
        
        for (index, element) in searches.enumerated() {
            let data: SearchDataModel = SearchDataModel(order: index, text: element)
            persistences.append(data)
        }
        persistence.save(searches: persistences)
    }
    
    func clear() {
        searches = []
        persistence.clear()
    }
    
}


extension SearchHistoryData {
    
    func loadHistory() -> [String] {
        return searches
    }
    
    func saveHistory() {
        save()
    }
    
    func addSearch(_ search: String) {
        if let _: String = searches.first(where: { $0 == search }) {
            removeSearch(search)
            return
        }
        searches.insert(search, at: 0)
    }
    
    func removeSearch(_ search: String) {
        if searches.isEmpty { return }
        searches.removeAll(where: { $0 == search })
    }
    
}
