//
//  PDPViewController.swift
//  RetoLiver
//
//  Created by AlejandroH on 18/03/20.
//  Copyright © 2020 AlejandroH. All rights reserved.
//

import UIKit

class PDPViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var thumbnail: UIImageView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var listPriceLabel: UILabel!
    @IBOutlet weak var promoPriceLabel: UILabel!
    
    // Properties
    var product: ProductDataModel!
    
}


// MARK: - Controller methods

extension PDPViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configure()
    }
    
}


// MARK: - Setup

extension PDPViewController {
    
    func configure() {
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



// MARK: - Actions

extension PDPViewController {
    
    @IBAction private func didPressClose(_ sender: UIButton) {
        closeViewController(animated: true)
    }
    
}
