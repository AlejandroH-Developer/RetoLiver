//
//  PLPViewController.swift
//  RetoLiver
//
//  Created by AlejandroH on 18/03/20.
//  Copyright © 2020 AlejandroH. All rights reserved.
//

import UIKit

class PLPViewController: UIViewController {
    
    // Outlets
    @IBOutlet weak var collectioView: UICollectionView!
    
    // Properties
    let plp: PLP = Manager.shared.plp
    var products: [ProductDataModel] = []
    
}


// MARK: - Controller methods

extension PLPViewController {
    
    override func viewDidLoad() {
           super.viewDidLoad()
    }
       
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configure()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    
}

// MARK: - Setup

extension PLPViewController {
    
    func configure() {
        loadData()
    }
    

    func loadData() {
        
        downloadProducts {
            self.collectioView.reloadData()
            self.collectioView.setContentOffset(.zero, animated: false)
            self.collectioView.isHidden = self.products.isEmpty
        }
        
    }
    
    
}


// MARK: - Methods

extension PLPViewController {
    
    func downloadProducts(completion: @escaping (()->())) {
        
        plp.getProducts { (result) in
            
            switch result {
                
            case .success(let products):
                self.products = products
                completion()
                
            case .fail(let message):
                print(message)

            }
         
        }
        
    }
    
    func goToSearch() {
        let controller: SearchViewController = SearchViewController.instanceFromStoryboard() as! SearchViewController
        self.presentViewController(controller, animated: true)
    }
    
}



// MARK: - Actions

extension PLPViewController {
    
    @IBAction private func didPressSearch(_ sender: UIButton) {
        goToSearch()
    }
    
}


// MARK: - CollectionView methods

extension PLPViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDelegate {
    
    // Datasource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item: ProductCell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        return item
    }
    
    // Layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.bounds.size.width / 2)
        let height: CGFloat = 1.4 * width
        return CGSize(width: width, height: height)
    }
    
    
    // Delegate
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }
    
}
