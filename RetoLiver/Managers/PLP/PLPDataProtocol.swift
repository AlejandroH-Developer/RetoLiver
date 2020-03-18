//
//  PLPDataProtocol.swift
//  RetoLiver
//
//  Created by AlejandroH on 18/03/20.
//  Copyright © 2020 AlejandroH. All rights reserved.
//

import Foundation


// MARK: - Results

enum PLPDataResult {
    case successful(products: [ProductDataModel])
    case failure(message: String)
}


// MARK: - Protocol

protocol PLPDataProtocol {
    func getPLP(completion: @escaping ((PLPDataResult) -> ()))
}
