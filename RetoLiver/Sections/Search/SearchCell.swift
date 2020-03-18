//
//  SearchCell.swift
//  RetoLiver
//
//  Created by AlejandroH on 17/03/20.
//  Copyright © 2020 AlejandroH. All rights reserved.
//

import UIKit

class SearchCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var titleLabel: UILabel!
    
}
    

// MARK: - Cell methods

extension SearchCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
