//
//  SearchHistoryDataProtocol.swift
//  RetoLiver
//
//  Created by AlejandroH on 17/03/20.
//  Copyright © 2020 AlejandroH. All rights reserved.
//

import Foundation

protocol SearchHistoryDataProtocol {
    func loadHistory() -> [String]
    func saveHistory()
    func clearHistory()
    func addSearch(_ search: String)
    func removeSearch(_ search: String)
}
