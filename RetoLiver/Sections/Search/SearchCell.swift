//
//  SearchCell.swift
//  RetoLiver
//
//  Created by AlejandroH on 17/03/20.
//  Copyright © 2020 AlejandroH. All rights reserved.
//

import UIKit

protocol SearchCellDelegate: class {
    func remove(criteria: String)
}


class SearchCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var criteriaLabel: UILabel!
    
    // Properties
    weak private var delegate: SearchCellDelegate?
    private var criteria: String!
    
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



// MARK: - Setup

extension SearchCell {
    
    func setUp(target: SearchCellDelegate, criteria: String) {
        self.criteria = criteria
        self.delegate = target
        loadViews()
    }
    
    func loadViews() {
        self.criteriaLabel.text = criteria
    }
    
}


// MARK: - Actions

extension SearchCell {
    
    @IBAction private func didPressRemoveSearch(_ sender: UIButton) {
        delegate?.remove(criteria: criteria)
    }
    
}
