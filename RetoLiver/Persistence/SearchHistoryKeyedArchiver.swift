//
//  SearchHistoryKeyedArchiver.swift
//  RetoLiver
//
//  Created by AlejandroH on 17/03/20.
//  Copyright © 2020 AlejandroH. All rights reserved.
//

import Foundation

private let file_name = "search_history_persistence.dat"

class SearchHistoryKeyedArchiver: SearchHistoryPersistenceProtocol {
    
    func save(searches: [SearchDataModel]) {
        
        // Get file
        guard let file = fileURL() else { return }
        
        // Convert model to persistence
        var persistence: [SearchHistoryPersistence] = []
        
        for data in searches {
            persistence.append(SearchHistoryPersistence(data: data))
        }
        
        // Add to dictionary
        let dic = ["SearchHistoryPersistence": persistence] as [String:Any]
        
        // Archive in file
        do {
            let archiveData = try NSKeyedArchiver.archivedData(withRootObject: dic, requiringSecureCoding: false)
            try archiveData.write(to: file)
            print("Saved succesfully: \(archiveData) ")
        } catch {
            print(error)
        }
                
    }
    
    func load() -> [SearchDataModel] {
        
        // Get file
        guard let file = fileURL() else { return [] }
                
        // Get persistence
        guard
            let archivedData = try? Data(contentsOf: file),
            let persistence = (try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(archivedData)) as? [String:Any],
            let searchPersistence = persistence["SearchHistoryPersistence"] as? [SearchHistoryPersistence]
        else {
           return []
        }
                
        // Convert persistence to model
        var searches: [SearchDataModel] = []
        for item in searchPersistence {
            searches.append(item.data)
        }
        
        return searches
        
    }
    
    
    func clear() {
        
        // Get file
        guard let file = fileURL() else { return }
        
        // Validate file
        guard FileManager.default.fileExists(atPath: file.absoluteString) else { return }
        
        // Remove file
        do {
            try FileManager.default.removeItem(at: file)
        }catch {
            print(error)
        }
    }
    
    
}


private extension SearchHistoryKeyedArchiver {
    
    func fileURL() -> URL? {
        let manager = FileManager.default
        guard let dir = try? manager.url(for: .applicationDirectory, in: .userDomainMask, appropriateFor: nil, create: true) else { return nil }
        return dir.appendingPathComponent(file_name)
    }
    
}
