//
//  ProductCell.swift
//  RetoLiver
//
//  Created by AlejandroH on 18/03/20.
//  Copyright © 2020 AlejandroH. All rights reserved.
//

import UIKit
import Alamofire

class ProductCell: UITableViewCell {
    
    // Outlets
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var listPriceLabel: UILabel!
    @IBOutlet weak var promoPriceLabel: UILabel!
    
    // Properties
    var product: ProductDataModel!
}


// MARK: - Cell methods

extension ProductCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}


// MARK: - Setup

extension ProductCell {
    
    func setUp(product: ProductDataModel) {
        self.product = product
        loadViews()
    }
    
    private func loadViews() {
        self.idLabel.text = "SKU: " + product.id
        self.nameLabel.text = product.name
        self.listPriceLabel.text = product.normalPrice.toString()
        self.promoPriceLabel.text = product.finalPrice.toString()
        self.thumbnail.downloadImage(product.imageURL)
    }
    
}



extension Double {
    func toString(decimals: Int = 2) -> String {
        if self == 0 { return "" }
        return String(format: "$ %.\(decimals)f", self)
    }
}
