//
//  User.swift
//  RetoLiver
//
//  Created by AlejandroH on 18/03/20.
//  Copyright © 2020 AlejandroH. All rights reserved.
//

import Foundation

class Manager {
    
    static let shared = Manager()
    
    var plp: PLP!
    
    private init() {
        plp = PLP()
    }
    
}
