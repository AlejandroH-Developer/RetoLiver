//
//  SearchHistoryKeyedArchiver.swift
//  RetoLiver
//
//  Created by AlejandroH on 17/03/20.
//  Copyright © 2020 AlejandroH. All rights reserved.
//

import Foundation

private let file_name = "SearchHistory.dat"

class SearchHistoryKeyedArchiver: SearchHistoryPersistenceProtocol {
    
    func save(searches: [SearchDataModel]) {
        var persistence: [SearchHistoryPersistence] = []
        
        for data in searches {
            persistence.append(SearchHistoryPersistence(data: data))
        }
        
        guard let file = fileURL() else { return }
        
        let dic = ["SearchHistoryPersistence": persistence] as [String:Any]
        
        //NSKeyedArchiver.archiveRootObject(dic, toFile: file)
        
        if let archiveData = try? NSKeyedArchiver.archivedData(withRootObject: dic, requiringSecureCoding: true) {
            try? archiveData.write(to: file)
        }
                
    }
    
    func load() -> [SearchDataModel] {
        
        guard let file = fileURL() else { return [] }
        
        //guard let data = NSKeyedUnarchiver.unarchiveObject(withFile: file.path) as? [String : Any] else {return []}
        
        guard let archivedData = try? Data(contentsOf: file), let persistence = (try? NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(archivedData)) as? [SearchHistoryPersistence] else {
           return []
        }
        
        var searches: [SearchDataModel] = []
        
        for item in persistence {
            searches.append(item.data)
        }

        return searches
        
    }
    
    
    func clear() {
        guard let file = fileURL() else { return }
        guard FileManager.default.fileExists(atPath: file.absoluteString) else { return }
        
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
