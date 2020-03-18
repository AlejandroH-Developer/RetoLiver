//
//  SearchHistoryPersistenceProtocol.swift
//  RetoLiver
//
//  Created by AlejandroH on 17/03/20.
//  Copyright © 2020 AlejandroH. All rights reserved.
//

import Foundation

protocol SearchHistoryPersistenceProtocol {
    func save(searches: [SearchDataModel])
    func load() -> [SearchDataModel]
    func clear()
}
